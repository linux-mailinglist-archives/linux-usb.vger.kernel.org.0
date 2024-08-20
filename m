Return-Path: <linux-usb+bounces-13737-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8544E9587A1
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 15:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FE2D1F228EF
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 13:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED4D190064;
	Tue, 20 Aug 2024 13:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHQaRC2J"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB502745C
	for <linux-usb@vger.kernel.org>; Tue, 20 Aug 2024 13:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724159529; cv=none; b=NXPy2EPXhJQLKa0TshBJLUZUaKZmpvNqlK7gwsrSdGDSWa/ze3TScJoPJC048sYmxcM9OTPdILu/K4pnohkFMDXMbuvbZmx/6bvR29/gne1yQoaXyIBSfnYqnwwngQl8tU3Veot5ZQyY5+xWyTukrWzAF33oeNPOf0ay4fcxiBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724159529; c=relaxed/simple;
	bh=/5ABYsmfvceLJLtqvGgugVq6NKWA6RuyJW7ky1Vbi58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/W5fF6Zlnoz2rRNdsi8ZJlfETDHm/MvXjRoFHFeqgcBaCpRCDL6UdHhC1k6VgtwzZnP8cObZtbBme3gzvo8ui0F15W2DuVn//gXnuokTbXeuE4VnU8W7weoJE0kmQduUsbnF7aZ2E6ApHmPFhxXpHQeugoe25jP0rtAF9c8uQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHQaRC2J; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724159527; x=1755695527;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/5ABYsmfvceLJLtqvGgugVq6NKWA6RuyJW7ky1Vbi58=;
  b=kHQaRC2JntemhtEX0IjZcdJ8TcpMS1fNCh3AfvqQ8sRBhFobisB6ZZws
   gu+VTO8h59XXId06IsmRSrTpDaD6NtIaReyA0PeYorwI/hlu1TfsOzwPd
   tchuc6jK++qUeNlJ4Evo/z59DB5pYDoL/EsGWFkupjobjEmmIu4irUi7m
   DrSVjlNcfAUJ/WO0GoO4npg8YHowOSHaCIcVpZZHB6xaTNZboqYWHvaOG
   QGoDAiE08knCmHtIiTDYtvg5YtbNa72HOvF5sneM+t816CYZckqkd6lF+
   ki5a2sv/FM+yq99OgdfAzExmqXD/HWUnSqXHij1gV+fDXBUGpm83nwT89
   Q==;
X-CSE-ConnectionGUID: vaFjesHEQkOWdDPcj0Ri8Q==
X-CSE-MsgGUID: P0/ET9yPQyG0YijbyLTAEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="13113620"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="13113620"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 06:12:06 -0700
X-CSE-ConnectionGUID: EcGzWlcAShWwz1y7Grv3DQ==
X-CSE-MsgGUID: +VNvz7UIR/WX6kd3miVV+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="83925876"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmviesa002.fm.intel.com with SMTP; 20 Aug 2024 06:12:03 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 20 Aug 2024 16:12:01 +0300
Date: Tue, 20 Aug 2024 16:12:01 +0300
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
Message-ID: <ZsSWIQ7sMAeF9v9Y@kuha.fi.intel.com>
References: <20240816135859.3499351-1-heikki.krogerus@linux.intel.com>
 <20240816135859.3499351-2-heikki.krogerus@linux.intel.com>
 <CANFp7mUDm9Ya9Gjv9Bv_neL22SuDocmz_8HCGVbnd8y-0gd7tA@mail.gmail.com>
 <ZsMoUWSMtaxteBBf@kuha.fi.intel.com>
 <CANFp7mU69-4_v5JaycrPjt3ZnfyRa8PypFa=_gbuW9qW6_z9dw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANFp7mU69-4_v5JaycrPjt3ZnfyRa8PypFa=_gbuW9qW6_z9dw@mail.gmail.com>

On Mon, Aug 19, 2024 at 04:23:56PM -0700, Abhishek Pandit-Subedi wrote:
> On Mon, Aug 19, 2024 at 4:11 AM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > Hi Abhishek,
> >
> > On Sun, Aug 18, 2024 at 05:02:28PM -0700, Abhishek Pandit-Subedi wrote:
> > > On Fri, Aug 16, 2024 at 6:59 AM Heikki Krogerus
> > > <heikki.krogerus@linux.intel.com> wrote:
> > > >
> > > > The new fields are valid only with the new UCSI versions.
> > > > They are at offsets that go beyond the MAX_DATA_LENGTH (16
> > > > bytes) with the older UCSI versions. That has not caused any
> > > > problems before because nothing uses those new fields yet.
> > > > Because they are not used yet, dropping them for now.
> > > >
> > > > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > ---
> > > >  drivers/usb/typec/ucsi/ucsi.h | 27 ++-------------------------
> > > >  1 file changed, 2 insertions(+), 25 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> > > > index 57129f3c0814..7bc132b59027 100644
> > > > --- a/drivers/usb/typec/ucsi/ucsi.h
> > > > +++ b/drivers/usb/typec/ucsi/ucsi.h
> > > > @@ -344,35 +344,12 @@ struct ucsi_connector_status {
> > > >  #define   UCSI_CONSTAT_PARTNER_TYPE_AUDIO      6
> > > >         u32 request_data_obj;
> > > >
> > > > -       u8 pwr_status[3];
> > > > -#define UCSI_CONSTAT_BC_STATUS(_p_)            ((_p_[0]) & GENMASK(1, 0))
> > > > +       u8 pwr_status;
> > > > +#define UCSI_CONSTAT_BC_STATUS(_p_)            ((_p_) & GENMASK(1, 0))
> > > >  #define   UCSI_CONSTAT_BC_NOT_CHARGING         0
> > > >  #define   UCSI_CONSTAT_BC_NOMINAL_CHARGING     1
> > > >  #define   UCSI_CONSTAT_BC_SLOW_CHARGING                2
> > > >  #define   UCSI_CONSTAT_BC_TRICKLE_CHARGING     3
> > > > -#define UCSI_CONSTAT_PROVIDER_CAP_LIMIT(_p_)   (((_p_[0]) & GENMASK(5, 2)) >> 2)
> > > > -#define   UCSI_CONSTAT_CAP_PWR_LOWERED         0
> > > > -#define   UCSI_CONSTAT_CAP_PWR_BUDGET_LIMIT    1
> > > > -#define UCSI_CONSTAT_PROVIDER_PD_VERSION_OPER_MODE(_p_)        \
> > > > -       ((get_unaligned_le32(_p_) & GENMASK(21, 6)) >> 6)
> > > > -#define UCSI_CONSTAT_ORIENTATION(_p_)          (((_p_[2]) & GENMASK(6, 6)) >> 6)
> > > > -#define   UCSI_CONSTAT_ORIENTATION_DIRECT      0
> > > > -#define   UCSI_CONSTAT_ORIENTATION_FLIPPED     1
> > > > -#define UCSI_CONSTAT_SINK_PATH_STATUS(_p_)     (((_p_[2]) & GENMASK(7, 7)) >> 7)
> > > > -#define   UCSI_CONSTAT_SINK_PATH_DISABLED      0
> > > > -#define   UCSI_CONSTAT_SINK_PATH_ENABLED       1
> > > > -       u8 pwr_readings[9];
> > > > -#define UCSI_CONSTAT_REV_CURR_PROT_STATUS(_p_) ((_p_[0]) & 0x1)
> > > > -#define UCSI_CONSTAT_PWR_READING_VALID(_p_)    (((_p_[0]) & GENMASK(1, 1)) >> 1)
> > > > -#define UCSI_CONSTAT_CURRENT_SCALE(_p_)                (((_p_[0]) & GENMASK(4, 2)) >> 2)
> > > > -#define UCSI_CONSTAT_PEAK_CURRENT(_p_) \
> > > > -       ((get_unaligned_le32(_p_) & GENMASK(20, 5)) >> 5)
> > > > -#define UCSI_CONSTAT_AVG_CURRENT(_p_) \
> > > > -       ((get_unaligned_le32(&(_p_)[2]) & GENMASK(20, 5)) >> 5)
> > > > -#define UCSI_CONSTAT_VOLTAGE_SCALE(_p_) \
> > > > -       ((get_unaligned_le16(&(_p_)[4]) & GENMASK(8, 5)) >> 5)
> > > > -#define UCSI_CONSTAT_VOLTAGE_READING(_p_) \
> > > > -       ((get_unaligned_le32(&(_p_)[5]) & GENMASK(16, 1)) >> 1)
> > > >  } __packed;
> > > >
> > > >  /*
> > > > --
> > > > 2.43.0
> > > >
> > > >
> > >
> > > I'm working on a patch series that depends on the sink path status so
> > > I would prefer we don't remove it:
> > > https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/5784952
> > >
> > > Since GET_CONNECTOR_STATUS is the only command that exceeds 16 bytes
> > > for MESSAGE_IN, can we just add a wrapper that checks the UCSI version
> > > for that command only and limits the size sent to ucsi_run_command?
> >
> > It's always "just this one command" :). It's actually not only the
> > GET_CONNECTOR_STATUS command in this case - at least GET_PD_MESSAGE
> > can also exceed 16 bytes - but even if it was, it would still not be
> > okay to simply guard the read. You would also have to check the
> > version with every access of those extended fields, and that's where
> > it's basically guaranteed to fail. Somebody will access those extended
> > fields unconditionally without anybody noticing sooner or later, and
> > that's why they can't be part of this data structure.
> 
> So this kind of points out a fundamental question to UCSI 1.2 vs
> UCSI2+ in this driver: should we be doing a single driver that checks
> the UCSI version before doing things or have two separate drivers?

Nobody is proposing a driver split.

> I'm in favor of a single driver approach as I think there are a lot of
> commonalities between the different UCSI versions. I think zero-ing
> out the extended data on reads should be sufficient to support both
> versions from the same code-base.

Unfortunately 0 is a valid value also in this case.

> The alternative of creating a separate driver comes with more problems
> -- do we fork for ucsi2 AND ucsi3? ucsi3 adds additional commands
> (i.e. set_usb) and, in the case of get_pd_message, adds additional
> behavior to existing commands (Get_Revision).

Again, nobody is proposing a driver split. I don't know where did you
get this idea.

> If your main worry is that people will unconditionally use the new
> bits, why don't we simply change the macros from UCSI_CONSTAT to
> UCSI_CONSTAT_v2 to indicate they need a revision bump? We can make
> similar changes to other macros + enums to indicate the minimum UCSI
> version that added those values.

Simply naming a macro is not enough. A macro is fine, but it must have
the means to check the version and fail if it does not match.

We have a golden opportunity here to do exactly that. In most cases
only fields are extended, which is much more difficult situation, but
in this case we actually have completely new fields that extend the
data structure. That makes it possible to use the size like I'm doing
in patch 3/5 which guarantees that driver fails if those extended
fields are accessed when they are not available. That is exactly what
we want.

Otherwise accessing those fields when they are not available will
create the issues silently, most likely in form of a horrible user
experience: the cable works only if you plug it one way but not the
other because something thinks the orientation field is valid, or the
screen may simply be black. There are no error messages in dmesg, so
from kernel PoW everything seems to be working as it should. This is
not what we want. What we want is a spectacular failure if something
like that happens.

That failure will give us these two things:

1. It pin points the root cause of these issues.
2. If forces us to actually fix the issue (these are usually not
   considered as critical issues unfortunately).

These "silent" issues are really common and they always take a lot of
time to debug. I'm not going to waste this opportunity to make them a
bit less "silent" in this case.

thanks,

-- 
heikki

