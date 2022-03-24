Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D54CD4E6141
	for <lists+linux-usb@lfdr.de>; Thu, 24 Mar 2022 10:45:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245285AbiCXJqi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Mar 2022 05:46:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240369AbiCXJqh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Mar 2022 05:46:37 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A48D19BB84
        for <linux-usb@vger.kernel.org>; Thu, 24 Mar 2022 02:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648115106; x=1679651106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3io4DtMeMK6OzsQLZExB12RAEiyKAHD3H4e/3sNzxXM=;
  b=XsXiVg/ZwoscQYm90BWDTb4iM440Ye3nf3L7X+yA4ohrOKmlyTs9Afxa
   pIFoRV0u4XE3BayCKaQo/4z/Y3We7+W+wWyS85D1FgjZDgRlMm2xNElhE
   H5bN678DYxw0PeyxetMYIldI+4MCxLeePZsSBcsFAREw5HzvVONXssuf/
   J7E/rbMAsJFVXGLQSc5ycdKZxysCDfDm0phDvgHsawm9p4ysOSVRU7u3u
   GFArwEvN+O171ksL9QyG2+/kNZAqHf6kMIlP/gNPpZZrVwwryVvrZZM0r
   mPkn56Ccfr84yDYghk3Ekx4sf20xHPL7MG8TYSX+NtDxlWi4Bibv+vfwo
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="255897729"
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400"; 
   d="scan'208";a="255897729"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2022 02:45:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400"; 
   d="scan'208";a="693262631"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 24 Mar 2022 02:45:04 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 24 Mar 2022 11:45:03 +0200
Date:   Thu, 24 Mar 2022 11:45:03 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: How to proceed: usci_acpi: PPM init failed (-110)
Message-ID: <Yjw9n5FXHMp8TpsM@kuha.fi.intel.com>
References: <20210823180626.tb6m7h5tp6adhvt2@fastboi.localdomain>
 <YSTI51ilGLJLYlQz@kuha.fi.intel.com>
 <20210824164942.6pakfzf2crnxes7w@fastboi.localdomain>
 <YSX5Gewqat7zbEXY@kuha.fi.intel.com>
 <20210825092138.jmhbjx2innikurw2@fastboi.localdomain>
 <YSdIb+f+/cbRyBs1@kuha.fi.intel.com>
 <20210826114105.amyjjhslqhiqdw6e@fastboi.localdomain>
 <178d8c7ca72400c2aa12679d4532611d@cavoj.net>
 <Ye5wFVwQTWawdPPK@kuha.fi.intel.com>
 <23e8104421efcf0937168e0ac5489367@cavoj.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23e8104421efcf0937168e0ac5489367@cavoj.net>
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi again,

I'm sorry for the super slow progress with this. Just a quick update.

On Sat, Feb 19, 2022 at 01:39:33AM +0100, Samuel Čavoj wrote:
> Hi
> 
> sorry about the delay.
> 
> On 2022-01-24 10:23, Heikki Krogerus wrote:
> > On Sat, Jan 22, 2022 at 12:21:29AM +0000, Samuel Čavoj wrote:
> > > Hi Heikki,
> > > 
> > > do you think we could get this back on track somehow? I'm not sure
> > > what to
> > > try next, do you have any ideas? Are there any tools to try and
> > > trace what
> > > the Windows driver does? Either from within Windows itself or
> > > intercept it
> > > somehow externally -- a hypervisor approach? Are there any tools
> > > developed
> > > for this purpose? I wasn't really able to find much.
> > 
> > I don't have any ideas right now, but I'll try to think of something
> > that we could try. I'll also see if I can get my hands on one of those
> > Asus Zenbook laptops. It was a Zenbook 13, right?
> 
> Yup, it's a Zenbook 13 OLED (UM325).

So, I'm not able to get one of those unfortunately.

> > Did you try to see what happens if you don't reset the "PPM"?
> 
> No difference, as far as I can tell. I used the patch below to
> get more output. This is right after boot, in the initramfs:
> 
> [    0.787887] ucsi_acpi USBC000:00: hi ucsi here
> [    0.787893] ucsi_acpi USBC000:00: skipping reset
> [    0.787894] ucsi_acpi USBC000:00: enable basic notifications
> [    0.813169] ucsi_acpi USBC000:00: got notification:
> [    0.814386] ucsi_acpi USBC000:00:     checking ua->flags: 2, cci: 0
> [    1.859334] ucsi_acpi USBC000:00: PPM init failed (-110)
> 
> Same output after cold boot, reboot from linux and reboot from windows.

Based on that output, there is a notification, and I'm assuming that
notification is for the command completion. But CCI is 0?

That could be because the mailbox in memory is not getting
synchronised for some reason, but it could also mean that the EC
firmware is really not writing anything to the CCI. Both cases
probable mean we are missing some extra step that Windows is doing,
but what... I have no idea.

thanks,

-- 
heikki
