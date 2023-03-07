Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA5B6ADC14
	for <lists+linux-usb@lfdr.de>; Tue,  7 Mar 2023 11:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbjCGKhK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Mar 2023 05:37:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbjCGKhI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Mar 2023 05:37:08 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B5015566;
        Tue,  7 Mar 2023 02:37:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B52D1B81733;
        Tue,  7 Mar 2023 10:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB02C433D2;
        Tue,  7 Mar 2023 10:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678185424;
        bh=oohYR7vZp6Kh1bYgg0CnLLGm6D0YntI+TcGGxWGNWz8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VQ0ffnA0REo6UWu2BQh+AsZtCPl/OxgWAO+7zO2FPqeNBSNq8xSJOYq1Dzf2a8u2a
         ju2WkUKdBpur2M2FW7x5dfUF1vtHLFLO0dd2MpKw5wLpmF/Gz9eFYiJQS/Ny+GfTQ5
         NP5SBXa0FJUQ/0YybLxuWoPrRpDCdpINvESxPgmf2lSRu3IbG5hBwHrpNM24XDen1m
         8XqcTS18Oi5r0GBlewC4TD+q92aXaDNRH6lns02oBDYglM+kEROZoHR5cBDtlXwsTz
         dE2+hw1vP2aVody9G+RN85MN24MMSW4QMD0o+AUUcTZ0OyCWEKrKPKIKTyczK+Ddfu
         0YCvVFRcv05mg==
Date:   Tue, 7 Mar 2023 10:36:59 +0000
From:   Lee Jones <lee@kernel.org>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Hyunwoo Kim <imv4bel@gmail.com>, mchehab@kernel.org,
        kernel@tuxforce.de, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, cai.huoqing@linux.dev
Subject: Re: [PATCH v3 0/4] Fix multiple race condition vulnerabilities in
 dvb-core and device driver
Message-ID: <20230307103659.GA347928@google.com>
References: <20221117045925.14297-1-imv4bel@gmail.com>
 <87lema8ocn.wl-tiwai@suse.de>
 <Y/YXbNgBhhWhfjwS@google.com>
 <Y/3mT9uSsuviT+sa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/3mT9uSsuviT+sa@google.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 28 Feb 2023, Lee Jones wrote:

> On Wed, 22 Feb 2023, Lee Jones wrote:
>
> > On Tue, 10 Jan 2023, Takashi Iwai wrote:
> >
> > > On Thu, 17 Nov 2022 05:59:21 +0100,
> > > Hyunwoo Kim wrote:
> > > >
> > > > Dear,
> > > >
> > > > This patch set is a security patch for various race condition vulnerabilities that occur
> > > > in 'dvb-core' and 'ttusb_dec', a dvb-based device driver.
> > > >
> > > >
> > > > # 1. media: dvb-core: Fix use-after-free due to race condition occurring in dvb_frontend
> > > > This is a security patch for a race condition that occurs in the dvb_frontend system of dvb-core.
> > > >
> > > > The race condition that occurs here will occur with _any_ device driver using dvb_frontend.
> > > >
> > > > The race conditions that occur in dvb_frontend are as follows
> >
> > [...]
> >
> > > > # 4. media: ttusb-dec: Fix memory leak in ttusb_dec_exit_dvb()
> > > > This is a patch for a memory leak that occurs in the ttusb_dec_exit_dvb() function.
> > > >
> > > > Because ttusb_dec_exit_dvb() does not call dvb_frontend_detach(),
> > > > several fe related structures are not kfree()d.
> > > >
> > > > Users can trigger a memory leak just by repeating connecting and disconnecting
> > > > the ttusb_dec device.
> > > >
> > > >
> > > > Finally, most of these patches are similar to this one, the security patch for
> > > > CVE-2022-41218 that I reported:
> > > > https://lore.kernel.org/linux-media/20221031100245.23702-1-tiwai@suse.de/
> > > >
> > > >
> > > > Regards,
> > > > Hyunwoo Kim
> > >
> > > Are those issues still seen with the latest 6.2-rc kernel?
> > > I'm asking because there have been a few fixes in dvb-core to deal
> > > with some UAFs.
> > >
> > > BTW, Mauro, the issues are tagged with several CVE's:
> > > CVE-2022-45884, CVE-2022-45886, CVE-2022-45885, CVE-2022-45887.
> >
> > Was there an answer to this question?
> >
> > Rightly or wrongly this patch is still being touted as the fix for some
> > reported CVEs [0].
> >
> > Is this patch still required or has it been superseded?  If the later,
> > which patch superseded it?
> >
> > Thanks.
> >
> > [0] https://nvd.nist.gov/vuln/detail/CVE-2022-45886
>
> Have these issues been fixed already?
>
> If not, is this patch set due to be merged or reviewed?

Still nothing heard from the author or any maintainer.

I'd take this as a hint if I had any social skills!

Please could someone provide me with a status report on these patches?

They appear to have CVEs associated with them.  Have they been fixed?

--
Lee Jones [李琼斯]
