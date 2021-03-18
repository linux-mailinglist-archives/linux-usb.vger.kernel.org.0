Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A5033FC63
	for <lists+linux-usb@lfdr.de>; Thu, 18 Mar 2021 01:50:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbhCRAt4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Mar 2021 20:49:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbhCRAtq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Mar 2021 20:49:46 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC5BC06174A
        for <linux-usb@vger.kernel.org>; Wed, 17 Mar 2021 17:49:45 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id n24so423928qkh.9
        for <linux-usb@vger.kernel.org>; Wed, 17 Mar 2021 17:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aXM0IiiTSNMZGkSnAeNlpftODP3fIqcv04JhMr1w2rQ=;
        b=nPmg+WVFOgKRvJg12jtbRro+o/QaM1AmuduJzNNd6jR0BaeRIPx2i4ROhDGfYESWMY
         rPmiwwhD8GZ1F21CYeKkyk4yTA89Jq4kOsEsUU7+fNa8FBYuRIWg3xPSVACKirT4Q1km
         inpJg4HhWddoTCWkO0m041U5ryHJouN5eKtbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aXM0IiiTSNMZGkSnAeNlpftODP3fIqcv04JhMr1w2rQ=;
        b=kSr5uI23XF6zjtDz613xizofr50zBQWoLJEAvts+n4L2874TC8+z64xfCkLdcpPzSp
         29nhJzxcrbX/cpC/vIotaSMryFd8zJLKCSBiGnOjl1KMNZ8cokkuC9+xGKSL8GUsUKz5
         D19f4zvWdwApvdLo5HM0lZ/HbQ6ufxdeG8P4IEVxy05r32gzeTEWCVvyuchVc/mf+5qE
         wh8/XURlZwBhPDyJjs/QPDqm0zazvVtlKCdqrdniCwUx4oLPn8xa7J9hXLH51BQhfQr+
         JCNIAowFzKNS4B5DuIdxwVrQP1KThn/5Y8b2fFuTk1yGTp/8yQ9f6t+aC2hnwnbAJonX
         mn3g==
X-Gm-Message-State: AOAM531dG8k9PqzzDijHttxX2sIzZ2on7GHYpogWebDKByDnHEjPa4wx
        NSF+uumyiaw9vxCMXnIAqaNNBqYIzr+rVTiHyAF19Q==
X-Google-Smtp-Source: ABdhPJyVbJD+5Ky8oxmXJB96otgzJjqRKKIkeML8Xt4XJkvVSFS+TzYye2P2AkfAZ2mzaJxuzzmx6vULlH4bxnvm2MQ=
X-Received: by 2002:a37:9d57:: with SMTP id g84mr1906120qke.71.1616028584856;
 Wed, 17 Mar 2021 17:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210309092330.5813-1-gil.fine@intel.com>
In-Reply-To: <20210309092330.5813-1-gil.fine@intel.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Wed, 17 Mar 2021 17:49:33 -0700
Message-ID: <CACeCKadX+ugHZTup5O7YXCtYpALg7rn7gAqCe4SBLa_nyU3hLA@mail.gmail.com>
Subject: Re: [PATCH] thunderbolt: debugfs: Show all accessible dwords
To:     Gil Fine <gil.fine@intel.com>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>,
        Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Gil,


On Tue, Mar 9, 2021 at 1:23 AM Gil Fine <gil.fine@intel.com> wrote:
>
> Currently, when first failure occurs while reading of the block,
> we stop reading the block and jump to the next capability.
> This doesn't cover the case of block with "holes" of inaccessible
> dwords, followed by accessible dwords.
> This patch address this problem.
> In case of failure while reading the complete block in one transaction,
> (because of one or more dwords is inaccessible), we read the remaining
> dwords of the block dword-by-dword, one dword per transaction,
> till the end of the block.
> By doing this, we handle the case of block with "holes" of inaccessible
> dwords, followed by accessible dwords. The accessible dwords are shown
> with the fields: <offset> <relative_offset> <cap_id> <vs_cap_id> <value>
> E.g.:
> 0x01eb  236 0x05 0x06 0x0000d166
> While the inaccesible dwords are shown as: <offset> <not accessible>
> E.g.:
> 0x01ed <not accessible>
>
> Signed-off-by: Gil Fine <gil.fine@intel.com>
> ---
>  drivers/thunderbolt/debugfs.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
> index 201036507cb8..c850b0ac098c 100644
> --- a/drivers/thunderbolt/debugfs.c
> +++ b/drivers/thunderbolt/debugfs.c
> @@ -265,10 +265,8 @@ static void cap_show_by_dw(struct seq_file *s, struct tb_switch *sw,
>                 else
>                         ret = tb_sw_read(sw, &data, TB_CFG_SWITCH, cap + offset + i, 1);
>                 if (ret) {
> -                       seq_printf(s, "0x%04x <not accessible>\n", cap + offset);
> -                       if (dwords - i > 1)
> -                               seq_printf(s, "0x%04x ...\n", cap + offset + 1);
> -                       return;
> +                       seq_printf(s, "0x%04x <not accessible>\n", cap + offset + i);
> +                       continue;
>                 }
>
>                 seq_printf(s, "0x%04x %4d 0x%02x 0x%02x 0x%08x\n", cap + offset + i,
> @@ -292,7 +290,7 @@ static void cap_show(struct seq_file *s, struct tb_switch *sw,
>                 else
>                         ret = tb_sw_read(sw, data, TB_CFG_SWITCH, cap + offset, dwords);
>                 if (ret) {
> -                       cap_show_by_dw(s, sw, port, cap, offset, cap_id, vsec_id, dwords);

Sorry for being late here:
Can we call cap_show_by_dw(..., dwords) directly here, instead of
having the logic of doing the block read and then resorting to this if
the block read fails?
Since it's debugfs, I doubt efficiency gains are paramount here, and
we have a simpler invocation at the callsite.

> +                       cap_show_by_dw(s, sw, port, cap, offset, cap_id, vsec_id, length);
>                         return;
>                 }
>
> --
> 2.17.1
>
> ---------------------------------------------------------------------
> Intel Israel (74) Limited
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
>
