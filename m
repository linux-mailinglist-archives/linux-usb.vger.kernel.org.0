Return-Path: <linux-usb+bounces-1683-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 369267CAF95
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 18:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6368D1C20BAD
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 16:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3976530F95;
	Mon, 16 Oct 2023 16:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGUwP/gi"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B9C30F96
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 16:35:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B82987D91;
	Mon, 16 Oct 2023 09:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697474105; x=1729010105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XHgG6AwTXSuXo/oRlKIUbP9Fwdm8hlGaOqwUtMzxG9Q=;
  b=TGUwP/giY1PoHbxk5Bj7Yyne8ae41HJKPbw/7C1ilF2o/y9QsfJI+oQh
   3Ola4RwzF8mD/wa4sWx4bTHCtuekTiIh+Gy5tL08HAvsoxOPN7rGW8HJ7
   lFgmT3PK4OivcAwxMPi9aWC/RWPyMoVFAchCMqk6PyBGHOaduLFkRNK+w
   C/kUb/WFXEoAikvIYkqnQgpZ0ktKLSfqK5ZAupNi21YpnJGDJDWV6attv
   Jt6rzc+Exc38607fnAOMeBl8MJgOkzTaZJRkuxEFH9R7UVAf7j31Ybch+
   gVLhW1eVKNcy4mSiFZKu/9q1YHpg3w2SJ0ebUzAwOCJqzJ1+vdDGff742
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="449786465"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="449786465"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 09:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="759461692"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="759461692"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 09:34:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qsQ5w-000000062PB-24R4;
	Mon, 16 Oct 2023 19:05:28 +0300
Date: Mon, 16 Oct 2023 19:05:28 +0300
From: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
To: "Wu, Wentong" <wentong.wu@intel.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	"oneukum@suse.com" <oneukum@suse.com>,
	"wsa@kernel.org" <wsa@kernel.org>,
	"andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"Wang, Zhifeng" <zhifeng.wang@intel.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v20 1/4] usb: Add support for Intel LJCA device
Message-ID: <ZS1fSPhfREVlELLD@smile.fi.intel.com>
References: <6a87b43a-0648-28d4-6c69-e0f684e44eb6@redhat.com>
 <DM6PR11MB4316BE44F53E276384FF06C88DCCA@DM6PR11MB4316.namprd11.prod.outlook.com>
 <5d2e9eba-a941-ea9a-161a-5b97d09d5d35@redhat.com>
 <ZSmjEKfYzFuAHXW+@smile.fi.intel.com>
 <9a080d06-586d-686f-997e-674cb8d16099@redhat.com>
 <DM6PR11MB43169A9ADDA7681DB7D9347C8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <ZSzogNhlX9njvOIU@smile.fi.intel.com>
 <DM6PR11MB4316382324D15985A70E531C8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <2023101653-shiftless-scorebook-19e3@gregkh>
 <DM6PR11MB4316711C71937AE3C0516C7B8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB4316711C71937AE3C0516C7B8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 16, 2023 at 06:44:21PM +0300, Wu, Wentong wrote:
> > From: gregkh@linuxfoundation.org
> > On Mon, Oct 16, 2023 at 03:05:09PM +0000, Wu, Wentong wrote:
> > > > From: Shevchenko, Andriy
> > > > On Mon, Oct 16, 2023 at 08:52:28AM +0300, Wu, Wentong wrote:

...

> > > > But this does not confirm if you have such devices. Moreover, My
> > > > question about _CID per function stays the same. Why firmware is not using
> > it?
> > >
> > > Yes, both _ADR and _CID can stop growing list in the driver. And for
> > > _ADR, it also only require one ID per function. I don't know why BIOS
> > > team doesn't select _CID, but I have suggested use _ADR internally,
> > > and , to make things moving forward, the driver adds support for _ADR here
> > first.
> > >
> > > But you're right, _CID is another solution as well, we will discuss it
> > > with firmware team more.
> > 
> > Should I revert this series now until this gets sorted out?
> 
> Current _ADR support is a solution, I don't think _CID is better than _ADR to both
> stop growing list in driver and support the shipped hardware at the same time.
> 
> Andy, what's your idea? 

In my opinion if _CID can be made, it's better than _ADR. As using _ADR like
you do is a bit of grey area in the ACPI specification. I.o.w. can you get
a confirmation, let's say, from Microsoft, that they will go your way for other
similar devices?

Btw, Microsoft has their own solution actually using _ADR for the so called
"wired" USB devices. Is it your case? If so, I'm not sure why _HID has been
used from day 1...

Also I suggest to wait for Hans' opinion on the topic.

-- 
With Best Regards,
Andy Shevchenko



