Return-Path: <linux-usb+bounces-306-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0607A43D3
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 10:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E5F51C20C1D
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 08:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F65C14276;
	Mon, 18 Sep 2023 08:04:37 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9287466
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 08:04:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBE59E55;
	Mon, 18 Sep 2023 01:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695024242; x=1726560242;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IOZ5ST0b115tZcGqcBmYtjTOXXLGsl37rzvNJdPtNrQ=;
  b=bl2sQZq4uXKYMUkzNg4evqfgSI/op5RzCKhuW1OTKi5iCY2xoOSfHECJ
   +twNAiSINxaeK/dhqFRZr25S2PpLzGe2aRGWHC6/UuOEhuO1fRNv0Qyvo
   uGTsgIb++mZZ6H3PHn2wGoVmm/fAwMzF6oeT/rNIKPFuw8l6b3XrRlIVA
   bfTdJKyen1pVhVPEsS6OeTZMTUtmoNExSIf7F9dwpxJshODmLjxTdCIpX
   aOmV+/MURSxTWQSLWiCFKk6K1s1s0vXKqEmj7I50xOkoUuIaIjs3s341c
   8fNpDHeipY0E5mi/Y1TNe9HoMDD7cdACfsNct3ZN1+M/ymtJkKYrg+Rpz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="443670758"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="443670758"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 01:04:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="992621087"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="992621087"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga006.fm.intel.com with SMTP; 18 Sep 2023 01:03:58 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 18 Sep 2023 11:03:57 +0300
Date: Mon, 18 Sep 2023 11:03:57 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: "Patel, Utkarsh H" <utkarsh.h.patel@intel.com>
Cc: Prashant Malani <pmalani@chromium.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"bleung@chromium.org" <bleung@chromium.org>
Subject: Re: [PATCH v3 3/4] platform/chrome: cros_ec_typec: Add Displayport
 Alternatemode 2.1 Support
Message-ID: <ZQgEbXDNZ+Ap/HiV@kuha.fi.intel.com>
References: <20230912005752.1532888-1-utkarsh.h.patel@intel.com>
 <20230912005752.1532888-4-utkarsh.h.patel@intel.com>
 <CACeCKacmH19niA7gWTZCj89ZmFth0LWvkMYasYwUvVHrmFKCZw@mail.gmail.com>
 <MWHPR11MB0048848CD12DC750417E7264A9F6A@MWHPR11MB0048.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MWHPR11MB0048848CD12DC750417E7264A9F6A@MWHPR11MB0048.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Sep 15, 2023 at 04:01:44PM +0000, Patel, Utkarsh H wrote:

> > > b057250704e8..3a747938cdab 100644
> > > --- a/include/linux/usb/pd_vdo.h
> > > +++ b/include/linux/usb/pd_vdo.h
> > > @@ -376,6 +376,7 @@
> > >          | ((vbm) & 0x3) << 9 | (sbu) << 8 | (sbut) << 7 | ((cur) & 0x3) << 5   \
> > >          | (vbt) << 4 | (sopp) << 3 | ((spd) & 0x7))
> > >
> > > +#define VDO_TYPEC_CABLE_SPEED(vdo)     ((vdo) & 0x7)
> > 
> > I would suggest putting this header modification in a separate patch; if for
> > some reason we have to revert the Chrome part of the change, then we won't
> > rip this part out too (some other driver down the road may use the macro and
> > would break if it were to be removed). But I'll leave it to Heikki to determine
> > whether that is preferred.
> > 
> Heikki,  What's your preference here?

I think separate patch for this like Prashant said.

thanks,

-- 
heikki

