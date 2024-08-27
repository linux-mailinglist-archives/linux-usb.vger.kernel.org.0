Return-Path: <linux-usb+bounces-14182-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 942D49611CC
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 17:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 094DEB25A32
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 15:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8F11C93A4;
	Tue, 27 Aug 2024 15:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zx7iBvPi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0311C57BF
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 15:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724772197; cv=none; b=a8ezN1ru1TgIOTngxo4hEGO7psIRPVK4mt0T8cj22p7ZEJCbaEBYLZltecjRfvV+WSK9Osk9CC/5TIb/8qKiJL0+qsJVZf5G3DXtTyCVFmfB7V86zd74TzAdenX6jx3Oey/lrpOK8GBlcTqO/t2BCwFVlbLgjgLuOt/q9cckYy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724772197; c=relaxed/simple;
	bh=1D98Cp8N9HGQz1OuxWlecZFwgHIhpdNR0NiBgRN49G0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KK6NY77tzUUoK2AdWzheQ6yf8NkgGE9D6m/IlHY96UVgZ0NLOp2YS3PPX3xEhc4qXVEIIwaBA0G2bXgXB4adOFLHZSpbUvsVzxQQIeQTIJdwdFslQCaC1akoM3QZE18P0DjE2aDEOmw2/1n5/tFbk+LSi7B0NmHFrFQ9vYhrvOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zx7iBvPi; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724772195; x=1756308195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1D98Cp8N9HGQz1OuxWlecZFwgHIhpdNR0NiBgRN49G0=;
  b=Zx7iBvPi3fg23PYlzrbxUcwiKq9E8zLv5upUxwXyXMSXEtmGUvXelPcq
   lIvC97ycUBAH0clh0C4yEjVz6whC8xz3HHpTcU2gFHkedogRj9h1rk1UY
   PY1EmW8k5KFKSpORAZLr20JQKmwWJIF+DGHlZrp3rw9Tmp7NIBau3NNv8
   L4z0SRlKDAyDqTxT4yLn6zWWIOLyyghC1amNlOg5jsUBk7TD/oNG0SZvT
   ORFyx0bJinyMwrQ0B7TxnoZmflXmMZnJycecvpb+pXjqG6YtVgUdHU3e4
   wsJcDYfaR/o8NZniiwyIWQThQxq2YDE57oX5t7vqHHmJ6UfKYjERaVIpm
   Q==;
X-CSE-ConnectionGUID: CvdT9DtfRzGhfKKvFJTIOg==
X-CSE-MsgGUID: GnDWF1gBRB2XK5C7wJ5EgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23432846"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="diff'?scan'208";a="23432846"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 08:23:14 -0700
X-CSE-ConnectionGUID: QjMyzPvlQMCTl4m8VSr/yg==
X-CSE-MsgGUID: Ar9zZojiQYOiojA+R2BMzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="diff'?scan'208";a="86093759"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmviesa002.fm.intel.com with SMTP; 27 Aug 2024 08:23:11 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 27 Aug 2024 18:23:10 +0300
Date: Tue, 27 Aug 2024 18:23:10 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-usb@vger.kernel.org,
	"Pilla, Siva sai kumar" <siva.sai.kumar.pilla@intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@google.com>,
	Bartosz Szpila <bszpila@google.com>
Subject: Re: [PATCH v2 1/6] usb: typec: ucsi: Remove unused fields from
 struct ucsi_connector_status
Message-ID: <Zs3vXigD3LdIqjAU@kuha.fi.intel.com>
References: <20240816135859.3499351-1-heikki.krogerus@linux.intel.com>
 <20240816135859.3499351-2-heikki.krogerus@linux.intel.com>
 <CANFp7mUDm9Ya9Gjv9Bv_neL22SuDocmz_8HCGVbnd8y-0gd7tA@mail.gmail.com>
 <ZsMoUWSMtaxteBBf@kuha.fi.intel.com>
 <CANFp7mU69-4_v5JaycrPjt3ZnfyRa8PypFa=_gbuW9qW6_z9dw@mail.gmail.com>
 <ZsSWIQ7sMAeF9v9Y@kuha.fi.intel.com>
 <CANFp7mUB4oiyEfh4P5cOucvdaWaC5N=OwcVdZ0Wm8EKBf=Ss9w@mail.gmail.com>
 <Zscf3IXZuepUqqv6@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="H6XgjSeU1/ZVCZ6m"
Content-Disposition: inline
In-Reply-To: <Zscf3IXZuepUqqv6@kuha.fi.intel.com>


--H6XgjSeU1/ZVCZ6m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 22, 2024 at 02:24:17PM +0300, Heikki Krogerus wrote:
> Hi Abhishek,
> 
> I'm sorry to keep you waiting.
> 
> > You have me convinced on the "failing loudly" part but I'm still
> > confused about the "how".
> > 
> > Making sure we always check versions to access the bits makes me think
> > we need wrappers on casting to the rightly versioned connector status.
> > Should we be versioning access for everything that's not in UCSI 1.2
> > then?
> > 
> > Example:
> > 
> > struct ucsi_connector_status_raw {
> >   u8 bytes[19];
> > };
> > 
> > struct ucsi_connector_status_v1 {
> >   ...
> > };
> > 
> > struct ucsi_connector_status_v2 {
> >   ...
> > };
> > 
> > struct ucsi_connector_status_v1* get_connector_status_v1(struct
> > ucsi_connector *con) {
> >   return (struct ucsi_connector_status_v1 *)con->raw_status;
> > }
> > 
> > struct ucsi_connector_status_v2* get_connector_status_v2(struct
> > ucsi_connector *con) {
> >   return con->ucsi->version >= UCSI_VERSION_2_0 ? (struct
> > ucsi_connector_status_v2 *)&con->raw_status : NULL;
> > }
> > 
> > /* Read all bits supported by the current version. */
> > int ucsi_read_connector_status(struct ucsi_connector *con, struct
> > ucsi_connector_status_raw *raw_conn_status);
> 
> I'll take a look at this next week. Right now I have to focus on
> other tasks.

Sorry again for the delay. Today I sketched the idea that I have. I
think this problem would be the easiest to handle with field specific
helpers (see attached).

But at the same time I would like to get rid of all command specific
data structures. I've been planning that for some time now. We can do
that with a macro like that UCSI_FIELD(). The problem with those
structures is that if the fields in the structure don't align nicely
(like in case of GET_CONNECTOR_STATUS), we have to come up with custom
members, and that is not ideal at all. There are probable other
problems too.

I did not convert anything yet, I'll prepare a more complete RFC
tomorrow, but you should be able to get the idea from this.

thanks,

-- 
heikki

--H6XgjSeU1/ZVCZ6m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="ucsi_field.diff"

diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index c8c87377909d..972d7b364a3d 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -4,6 +4,7 @@
 #define __DRIVER_USB_TYPEC_UCSI_H
 
 #include <linux/bitops.h>
+#include <linux/bitfield.h>
 #include <linux/completion.h>
 #include <linux/device.h>
 #include <linux/power_supply.h>
@@ -352,6 +353,27 @@ struct ucsi_connector_status {
 #define   UCSI_CONSTAT_BC_TRICKLE_CHARGING	3
 } __packed;
 
+#define UCSI_CONNECTOR_CHANGE(_con)		UCSI_FIELD(&(_con)->status, 0, 16)
+#define UCSI_CONNECTOR_PWR_OPMODE(_con)		UCSI_FIELD(&(_con)->status, 16, 3)
+#define UCSI_CONNECTOR_CONNECTED(_con)		UCSI_FIELD(&(_con)->status, 19, 1)
+#define UCSI_CONNECTOR_PWR_DIR(_con)		UCSI_FIELD(&(_con)->status, 20, 1)
+#define UCSI_CONNECTOR_PARTNER_FLAGS(_con)	UCSI_FIELD(&(_con)->status, 21, 8)
+#define UCSI_CONNECTOR_PARTNER_TYPE(_con)	UCSI_FIELD(&(_con)->status, 29, 3)
+#define UCSI_CONNECTOR_RDO(_con)		UCSI_FIELD(&(_con)->status, 32, 32)
+#define UCSI_CONNECTOR_BC_STATUS(_con)		UCSI_FIELD(&(_con)->status, 64, 2)
+#define UCSI_CONNECTOR_PD_STATUS(_con)		UCSI_FIELD(&(_con)->status, 70, 16)
+
+#define UCSI_FIELD(data, offset, size)					\
+	({								\
+		u8 m = ((offset) % 8);					\
+		FIELD_GET((GENMASK((m + ((size) - 1)), m)),		\
+			  (*((u32 *)(&((u8 *)data)[((offset) / 8)]))));	\
+	})
+
+#define UCSI_FIELD_SAFE(ucsi, data, offset, size)			\
+	if (!WARN_ON(((offset) / 8) >= UCSI_MAX_DATA_LENGTH(ucsi)))	\
+		UCSI_FIELD(data, offset, size)
+
 /* -------------------------------------------------------------------------- */
 
 struct ucsi_debugfs_entry {
@@ -513,4 +535,73 @@ static inline void ucsi_debugfs_unregister(struct ucsi *ucsi) { }
 #define USB_TYPEC_NVIDIA_VLINK_DP_VDO	0x1
 #define USB_TYPEC_NVIDIA_VLINK_DBG_VDO	0x3
 
+/* -------------------------------------------------------------------------- */
+
+static __always_inline enum typec_orientation ucsi_orientation(struct ucsi_connector *con)
+{
+	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
+		return TYPEC_ORIENTATION_NONE;
+	if (!UCSI_CONNECTOR_CONNECTED(con))
+		return TYPEC_ORIENTATION_NONE;
+	if (UCSI_FIELD(con, 86, 1))
+		return TYPEC_ORIENTATION_REVERSE;
+	return TYPEC_ORIENTATION_NORMAL;
+}
+
+static __always_inline int ucsi_sink_path_status(struct ucsi_connector *con)
+{
+	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
+		return -EINVAL;
+	return UCSI_FIELD(con, 87, 1);
+}
+
+static inline int ucsi_reverse_current_protection_status(struct ucsi_connector *con)
+{
+	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
+		return -EINVAL;
+	return UCSI_FIELD(con, 88, 1);
+}
+
+static inline int ucsi_power_reading_ready(struct ucsi_connector *con)
+{
+	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
+		return -EINVAL;
+	return UCSI_FIELD(con, 89, 1);
+}
+
+static inline int ucsi_current_scale(struct ucsi_connector *con)
+{
+	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
+		return -EINVAL;
+	return UCSI_FIELD(con, 90, 3) * 5; /* mA */
+}
+
+static inline int ucsi_peak_current(struct ucsi_connector *con)
+{
+	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
+		return -EINVAL;
+	return UCSI_FIELD(con, 93, 16);
+}
+
+static inline int ucsi_average_current(struct ucsi_connector *con)
+{
+	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
+		return -EINVAL;
+	return UCSI_FIELD(con, 109, 16);
+}
+
+static inline int ucsi_voltage_scale(struct ucsi_connector *con)
+{
+	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
+		return -EINVAL;
+	return UCSI_FIELD(con, 125, 4) * 5; /* mV */
+}
+
+static inline int ucsi_voltage_reading(struct ucsi_connector *con)
+{
+	if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
+		return -EINVAL;
+	return UCSI_FIELD(con, 129, 16);
+}
+
 #endif /* __DRIVER_USB_TYPEC_UCSI_H */

--H6XgjSeU1/ZVCZ6m--

