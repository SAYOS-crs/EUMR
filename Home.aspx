<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<%-- Add content controls here --%>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- ====== About Section (بعد الـ Carousel مباشرة) ====== -->
    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-7">
                    <div class="section-title mb-4">
                        <h5 class="position-relative d-inline-block text-primary text-uppercase">About Us</h5>
                        <h1 class="display-5 mb-0">Unified Medical Record Project Vision & Mission</h1>
                    </div>

                    <h3>Our Vision</h3>
                    <h4 class="text-body fst-italic mb-4">
                        To create a seamless digital healthcare ecosystem where every
                        citizen has instant, secure access to their complete medical history. We envision a future where
                        healthcare decisions are informed by comprehensive data, medical errors are minimized, and
                        patients are empowered partners in their health journey.
                    </h4>

                    <h3>Our Mission</h3>
                    <p class="mb-4">
                        To develop an integrated digital platform that consolidates medical records from all
                        healthcare providers - hospitals, laboratories, and radiology centers - into one secure,
                        accessible location. Using national ID as a unique identifier, we ensure that critical health
                        information follows patients wherever they go, enabling better clinical decisions and continuity
                        of care.
                    </p>

                    <div class="row g-3">
                        <div class="col-sm-6 wow zoomIn" data-wow-delay="0.3s">
                            <h2>Expected Impact</h2>
                            <h5>For Patients:</h5>

                            <h5 class="mb-3"><i class="fa fa-check-circle text-primary me-3"></i>Complete medical history</h5>
                            <h5 class="mb-3"><i class="fa fa-check-circle text-primary me-3"></i>Reduced duplicate testing</h5>
                        </div>

                        <div class="col-sm-6 wow zoomIn" data-wow-delay="0.6s">
                            <br><br><br>
                            <h5 class="mb-3"><i class="fa fa-check-circle text-primary me-3"></i>More accurate</h5>
                            <h5 class="mb-3"><i class="fa fa-check-circle text-primary me-3"></i>Faster receive</h5>
                        </div>
                    </div>
                </div>

                <div class="col-lg-5" style="min-height: 500px;">
                    <div class="position-relative h-100">
                        <img class="position-absolute w-100 h-100 rounded wow zoomIn" 
                             data-wow-delay="0.9s" src="img/about.jpg" 
                             style="object-fit: cover;">
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

