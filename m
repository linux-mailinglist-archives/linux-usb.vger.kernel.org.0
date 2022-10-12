Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E59615FC3CA
	for <lists+linux-usb@lfdr.de>; Wed, 12 Oct 2022 12:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbiJLKcc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Oct 2022 06:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbiJLKc3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Oct 2022 06:32:29 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D381BCBBD;
        Wed, 12 Oct 2022 03:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665570746; x=1697106746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gIRW35VesBaPkKZ4V6yQETWvChLvCII/4YASkT5hPzY=;
  b=H7zMwA9DlD2P08FBPq1ExdA8JZtz5byZnSTi/KyLu7Zyi6Byx/fQA/2u
   bQBVZ8psvJY+U8aQcVgqsdho8BKoB08LQdHQL7WqvxK8ctuMGpelcLKxv
   tD8PMrg2h1GwpJlEwTVxxfeylVkZvnECwvoIsLeHTG998mkqUa/u87l8X
   Hzs/2BoQcWGuGy7BLDdGp3bO8obVznRCb+FpxtWZViLwu3RiR88KEJy6/
   PzCsFCSj0ZGAvVxM1Wir+/A7BvIQoa8g0p0RmV6qBV5DaEczjyl/2g2pF
   mN8CfFxOMKM8a0G9aXMN2cKKpcKYE4BhEyG8chTktIafKYUF5tQym14d6
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="285139353"
X-IronPort-AV: E=Sophos;i="5.95,179,1661842800"; 
   d="scan'208";a="285139353"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2022 03:32:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="626719241"
X-IronPort-AV: E=Sophos;i="5.95,179,1661842800"; 
   d="scan'208";a="626719241"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 12 Oct 2022 03:32:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oiZ2E-005mdu-0l;
        Wed, 12 Oct 2022 13:32:22 +0300
Date:   Wed, 12 Oct 2022 13:32:21 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     Ferry Toth <fntoth@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] Revert "usb: dwc3: Don't switch OTG -> peripheral
 if extcon is present"
Message-ID: <Y0aXtWnlvpkJlxEP@smile.fi.intel.com>
References: <2886b82d-a1f6-d288-e8d1-edae54046b4f@gmail.com>
 <20221006021204.hz7iteao65dgsev6@synopsys.com>
 <d52cc102-6a4f-78e9-6176-b33e2813fd1d@gmail.com>
 <20221007021122.nnwmqc6sq43e5xbn@synopsys.com>
 <ade865f1-8ed5-a8e3-e441-cb7688c6d001@gmail.com>
 <CAHQ1cqGSmNSg73DzURrcP=a-cCd6KdVUtUmnonhP54vWVDmEhw@mail.gmail.com>
 <Y0PFZGLaREQUazVP@smile.fi.intel.com>
 <CAHQ1cqG73UAoU=ag9qSuKdp+MzT9gYJcwGv8k8BOa=e8gWwzSg@mail.gmail.com>
 <Y0U1j2LXmGLBYLAV@smile.fi.intel.com>
 <CAHQ1cqHOZr1fBzz=jXTudhw11K-uu4NK9acmeY_URwVxO7MJ7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHQ1cqHOZr1fBzz=jXTudhw11K-uu4NK9acmeY_URwVxO7MJ7Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 11, 2022 at 01:17:13PM -0700, Andrey Smirnov wrote:
> On Tue, Oct 11, 2022 at 2:21 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Oct 10, 2022 at 02:40:30PM -0700, Andrey Smirnov wrote:
> > > On Mon, Oct 10, 2022 at 12:13 AM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Sun, Oct 09, 2022 at 10:02:26PM -0700, Andrey Smirnov wrote:
> > > > > On Fri, Oct 7, 2022 at 6:07 AM Ferry Toth <fntoth@gmail.com> wrote:

...

> > > > > OK, Ferry, I think I'm going to need clarification on specifics on
> > > > > your test setup. Can you share your kernel config, maybe your
> > > > > "/proc/config.gz", somewhere? When you say you are running vanilla
> > > > > Linux, do you mean it or do you mean vanilla tree + some patch delta?
> > > > >
> > > > > The reason I'm asking is because I'm having a hard time reproducing
> > > > > the problem on my end. In fact, when I build v6.0
> > > > > (4fe89d07dcc2804c8b562f6c7896a45643d34b2f) and then do a
> > > > >
> > > > > git revert 8bd6b8c4b100 0f0101719138 (original revert proposed by Andy)
> > > > >
> > > > > I get an infinite loop of reprobing that looks something like (some
> > > > > debug tracing, function name + line number, included):
> > > >
> > > > Yes, this is (one of) known drawback(s) of deferred probe hack. I think
> > > > the kernel that Ferry runs has a patch that basically reverts one from
> > > > 2014 [1] and allows to have extcon as a module. (1)
> > > >
> > > > [1]: 58b116bce136 ("drivercore: deferral race condition fix")
> > > >
> > > > > which renders the system completely unusable, but USB host is
> > > > > definitely going to be broken too. Now, ironically, with my patch
> > > > > in-place, an attempt to probe extcon that ends up deferring the probe
> > > > > happens before the ULPI driver failure (which wasn't failing driver
> > > > > probe prior to https://lore.kernel.org/all/20220213130524.18748-7-hdegoede@redhat.com/),
> > > > > there no "driver binding" event that re-triggers deferred probe
> > > > > causing the loop, so the system progresses to a point where extcon is
> > > > > available and dwc3 driver eventually loads.
> > > > >
> > > > > After that, and I don't know if I'm doing the same test, USB host
> > > > > seems to work as expected. lsusb works, my USB stick enumerates as
> > > > > expected. Switching the USB mux to micro-USB and back shuts the host
> > > > > functionality down and brings it up as expected. Now I didn't try to
> > > > > load any gadgets to make sure USB gadget works 100%, but since you
> > > > > were saying it was USB host that was broken, I wasn't concerned with
> > > > > that. Am I doing the right test?
> > > >
> > > > Hmm... What you described above sounds more like a yet another attempt to
> > > > workaround (1). _If_ this is the case, we probably can discuss how to fix
> > > > it in generic way (somewhere in dd.c, rather than in the certain driver).
> > >
> > > No, I'm not describing an attempt to fix anything. Just how vanilla
> > > v6.0 (where my patch is not reverted) works and where my patch, fixing
> > > a logical problem in which extcon was requested too late causing a
> > > forced OTG -> "gadget only" switch, also changed the ordering enough
> > > to accidentally avoid the loop.
> >
> > You still refer to a fix, but my question was if it's the same problem or not.
> >
> 
> No, it's not the same problem.
> 
> > > > That said, the real test case should be performed on top of clean kernel
> > > > before judging if it's good or bad.
> > >
> > > Given your level of involvemnt with this particular platform and you
> > > being the author of
> > > https://github.com/edison-fw/meta-intel-edison/blob/master/meta-intel-edison-bsp/recipes-kernel/linux/files/0043b-TODO-driver-core-Break-infinite-loop-when-deferred-p.patch
> > > I assumed/expected you to double check this before sending this revert
> > > out. Please do so next time.
> >
> > As I said I have not yet restored my testing environment for that platform and
> > I relied on the Ferry's report. Taking into account the history of breakages
> > that done for Intel Merrifield, in particular by not wide tested patches
> > against DWC3 driver, I immediately react with a revert.
> 
> That's what I'm asking you not to do next time. If you don't have time
> to restore your testing env or double check Ferry's work, please live
> with a revert in your local tree until you do.

I trust Ferry's tests as mine and repeating again, we have a bad history
when people so value their time that breaks our platform, so please test
your changes in the future that it makes no regressions.

If you want to have a proof that your patches are broken, then I will
prioritize this. We now have a full release cycle time for that.

> My time is as valuable
> as yours and this revert required much more investigation before it
> was submitted. You lived with
> https://github.com/edison-fw/meta-intel-edison/blob/master/meta-intel-edison-bsp/recipes-kernel/linux/files/0043b-TODO-driver-core-Break-infinite-loop-when-deferred-p.patch
> since 5.10, which apparently was needed to either boot or have dwc3,
> so I don't think there is any real urgency.

It is in my tree only for the purpose of "don't forget that issue".
I think you can work around it by built-in extcon driver.


-- 
With Best Regards,
Andy Shevchenko


