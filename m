Return-Path: <linux-usb+bounces-14345-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BE6965A86
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 10:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66B211C212E9
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 08:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6C516D9A7;
	Fri, 30 Aug 2024 08:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GA1C2aol"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B005D16726E
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 08:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725007062; cv=none; b=lEtQlQxQoGJj459SaJPONdvUqJkAj7k5JXHZvt9rvUkh9w25gNDimVafAwCorYSfbXBlx5yckd4jod66PDcR4c9WdVlhzPlTKC797OWA50TKWUyRQd7y723pC+6STIVp6HxVBWSmpQ06HKeOTMnV5HWIhxRDdoA/Lgw1ArGtSeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725007062; c=relaxed/simple;
	bh=tOu74Qj9fj+19ujJXGbfRqOvvSk0lkYcYq4MkctFWIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Apftnrr2ge1pQfe/eT//+5749VTGeq5ipInSLXSrW56f0+NWCwLLE40yB5xUI8BIrbbNQcqv6QgpgiKWlCJR4CYLvi8ETlzdnIK285u99g2/TRZDkZ6FoWBQE4mKl6XflWrm0ZuOQNqyqMJc2f3lyLv2TV3t8x45gpWdOT6FLaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GA1C2aol; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725007061; x=1756543061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tOu74Qj9fj+19ujJXGbfRqOvvSk0lkYcYq4MkctFWIY=;
  b=GA1C2aol4f7T73xIYBlfyln1g7FHbPWqyjVno9Al4bBjiv3ftZJCY7/i
   QvUuYtfYMzEi/aHKdB8OTawjUbXGMEWdwVeR2Blhvdykl0vmQNBEKkE+F
   zzW5ASjX4OYkyhonBFBxDAxWHxrSwOIDE03o8KS3882KsdOOwomFrO16u
   QC73lTl0p1DhYMfbWkwdxJhiiu2wCE6SsJyBuzuqbpEU16tf1GgRm3EeT
   VCY8V2UgLXqf7DUk4se9Hap0wPUtBBEGTmC/M5ZUYUgrUP0t5mLpF13wW
   uqd5VwzFyK4/B4c4iFBaJnVEwUQtP3Gzs/JMk3OD829NignDHntCQQtbi
   g==;
X-CSE-ConnectionGUID: eCIY5EfYSVuawqvKpHA80w==
X-CSE-MsgGUID: m5Zf8KTiRi+Y3JPi0XSyjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23206743"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="23206743"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 01:37:40 -0700
X-CSE-ConnectionGUID: Su368qiyRWKHR9PMiaPNcw==
X-CSE-MsgGUID: Kh+dqlvESNSSSryukIDw9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="63829817"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmviesa008.fm.intel.com with SMTP; 30 Aug 2024 01:37:37 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 30 Aug 2024 11:37:36 +0300
Date: Fri, 30 Aug 2024 11:37:36 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>,
	Bartosz Szpila <bszpila@google.com>,
	"Pilla, Siva sai kumar" <siva.sai.kumar.pilla@intel.com>,
	linux-usb@vger.kernel.org
Subject: Re: [RFC PATCH 3/3] usb: typec: ucsi: Helpers for new
 GET_CONNECTOR_STATUS fields
Message-ID: <ZtGE0H0lgMxzMb8m@kuha.fi.intel.com>
References: <20240828161502.2774996-1-heikki.krogerus@linux.intel.com>
 <20240828161502.2774996-4-heikki.krogerus@linux.intel.com>
 <CANFp7mUHTNMA8XS+1K_jEstTrt8C6AcmizPChF0PVBifkzJPiA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANFp7mUHTNMA8XS+1K_jEstTrt8C6AcmizPChF0PVBifkzJPiA@mail.gmail.com>

On Thu, Aug 29, 2024 at 02:49:34PM -0700, Abhishek Pandit-Subedi wrote:
> On Wed, Aug 28, 2024 at 9:15 AM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > UCSI v2 introduced new fields to GET_CONNECTOR_STATUS.
> > Adding a helper for each field. The helpers check that the
> > UCSI version is v2 or above.
> >
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> >  drivers/usb/typec/ucsi/ucsi.h | 66 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 66 insertions(+)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> > index dfbc0f6c1b9b..adcbfc96dfcf 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.h
> > +++ b/drivers/usb/typec/ucsi/ucsi.h
> > @@ -524,4 +524,70 @@ static inline void ucsi_debugfs_unregister(struct ucsi *ucsi) { }
> >  #define USB_TYPEC_NVIDIA_VLINK_DP_VDO  0x1
> >  #define USB_TYPEC_NVIDIA_VLINK_DBG_VDO 0x3
> >
> > +/* -------------------------------------------------------------------------- */
> > +
> > +static inline enum typec_orientation ucsi_orientation(struct ucsi_connector *con)
> > +{
> > +       if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> > +               return TYPEC_ORIENTATION_NONE;
> > +       return UCSI_FIELD(con->status, 86, 1) ? TYPEC_ORIENTATION_REVERSE :
> > +                                               TYPEC_ORIENTATION_NORMAL;
> > +}
> > +
> > +static inline int ucsi_sink_path_status(struct ucsi_connector *con)
> > +{
> > +       if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> > +               return -EINVAL;
> > +       return UCSI_FIELD(con->status, 87, 1);
> > +}
> > +
> > +static inline int ucsi_reverse_current_protection_status(struct ucsi_connector *con)
> > +{
> > +       if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> > +               return -EINVAL;
> > +       return UCSI_FIELD(con->status, 88, 1);
> > +}
> > +
> > +static inline int ucsi_power_reading_ready(struct ucsi_connector *con)
> > +{
> > +       if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> > +               return -EINVAL;
> > +       return UCSI_FIELD(con->status, 89, 1);
> > +}
> > +
> > +static inline int ucsi_current_scale(struct ucsi_connector *con)
> > +{
> > +       if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> > +               return -EINVAL;
> > +       return UCSI_FIELD(con->status, 90, 3) * 5; /* mA */
> > +}
> > +
> > +static inline int ucsi_peak_current(struct ucsi_connector *con)
> > +{
> > +       if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> > +               return -EINVAL;
> > +       return UCSI_FIELD(con->status, 93, 16);
> > +}
> > +
> > +static inline int ucsi_average_current(struct ucsi_connector *con)
> > +{
> > +       if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> > +               return -EINVAL;
> > +       return UCSI_FIELD(con->status, 109, 16);
> > +}
> > +
> > +static inline int ucsi_voltage_scale(struct ucsi_connector *con)
> > +{
> > +       if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> > +               return -EINVAL;
> > +       return UCSI_FIELD(con->status, 125, 4) * 5; /* mV */
> > +}
> > +
> > +static inline int ucsi_voltage_reading(struct ucsi_connector *con)
> > +{
> > +       if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> > +               return -EINVAL;
> > +       return UCSI_FIELD(con->status, 129, 16);
> > +}
> > +
> >  #endif /* __DRIVER_USB_TYPEC_UCSI_H */
> > --
> > 2.45.2
> >
> 
> I think it would be nice to be able to declare what version a field
> was added when we describe the data structure rather than having to
> add helper functions for every single access of it.
> 
> Using the patch I had previously attempted as reference here too:
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/5274219
> 
> We could add a minimum version to each field definition like so:
> 
> #define UCSI_CONSTAT_SINK_PATH_STATUS \
>     UCSI_FIELD_FOR(/*struct=*/ucsi_connector_status,
> /*min_version=*/UCSI_2_0, /*offset=*/87, /*size=*/1)
> 
> These can default to WARN_ON + return -EINVAL when the minimum version
> doesn't match.
> 
> Pros: Minimum versions are alongside the field definitions, easier to
> keep track of and enforce.
> Cons:
>   - WARN may not easily identify which field is failing to access.
> This could be fixable.
>   - Version check for every field (and not just ones that need it).

I agree that the helpers are not very good in the end, and yes, the
macro needs to check the version for every field.

Yesterday I actually already reworked that macro to do exactly that.
It does not really need to do anything else - bitmap_read() does the
rest.

Structures I don't see any use with these. We should use data
structures if we could still use bitfields, but since they had to be
dropped, structures only make things difficult.

I'll send v2 today, or at least try to. There was an internal report
about bogus data in sysfs. I found one issues with the pd_revision
attribute file that is actually caused by the problem at hand - the
Partner PD Revision field in GET_CONNECTOR_CAPABILITY even when it's
not supported. I need to fix that at least, but there may be some
other problems too.

So I will in any case convert also struct ucsi_connector_capability to
bitmap while at it in v2. Let's continue the discussion from there.

Br,

-- 
heikki

