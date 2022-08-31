Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 267385A7255
	for <lists+linux-usb@lfdr.de>; Wed, 31 Aug 2022 02:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbiHaAUw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Aug 2022 20:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbiHaAUt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Aug 2022 20:20:49 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A629B67CB6
        for <linux-usb@vger.kernel.org>; Tue, 30 Aug 2022 17:20:47 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id d68so10666256iof.11
        for <linux-usb@vger.kernel.org>; Tue, 30 Aug 2022 17:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=bxn9VxVOYsV90b/AXcl+X3+2JZebJQygb6zbgA67ISw=;
        b=Sax+ObM4Va+lRmzJXxMoChcy8XRYUkndNMWBeoahPTarzKOmZ1LTVW8XPU++/jAkId
         VwcNtXaxJfXwL5CW/Qyrf84i54KvuKBetFq/9P6Na7HasaWkpIBvyed9a4OopHB07wKq
         jABVmxH5VCkvoy92YucmEexM/2dKC5CHLSCd1wY5FBtIkB1ElEaCS4whihdmsvW3fV72
         brRfMi7fasCZQqzYT5VXDhKoCizFKO2tiybzrK7y+CoSbUkVncuJYZ+rkOlaOolgR7wl
         6BPUbomzUxdtQpAZwp6zyZ7NPnb/JTH0YBVvCUeBd948VCJCNmP5DsyN3OOq2VBbQIKB
         Ifdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=bxn9VxVOYsV90b/AXcl+X3+2JZebJQygb6zbgA67ISw=;
        b=BOlGnC4LUn98y5ORxvizjnmGxvfFHBPrMfO4fDNlkSeBti38UsnsAiRx5KFpv5oVQl
         /6XT97AI7vu+AZr+bKzbp9ujQLmhHr/HOw4Kc8veugn/CVs05B8q4pBT0vnxFpMlyDZ/
         74e6SI8tgkzv274lLUX0ZzkWv/qLUq7E81JD3wY7augYUy33QzBWrLKTdnUtYdgSXzaJ
         hTAUXFWHRTzGm6gf0wSf6RoJUx3pG3s3R2rDUL3wG/XJZ8bNBTtaUluxeOR1Pt/USBny
         kran37jeBCfY6oyA9+zbKNLJl96ceA2amAo+F/9VYB5FSK7vVSq8bJ62rMrWx+ZFRjwK
         IRZQ==
X-Gm-Message-State: ACgBeo0HKkOsXjandBZISx+jBTdvSo2zwU7xNjR518wJBrXm2iBpTRDW
        HBK/VaX17pgzmsQ2WlLya7fDRoeQ5T2liqQNaa9TLA==
X-Google-Smtp-Source: AA6agR6zE6Tb6rAbgoVoGjxVMOS2HvKQJsnQ103/b24iLrHMlTfvVys1QxPbUMXlSm7+O1yBlpV4SXcGzjERV/4KBjU=
X-Received: by 2002:a05:6638:42c3:b0:349:fdfc:4543 with SMTP id
 bm3-20020a05663842c300b00349fdfc4543mr13316697jab.223.1661905246787; Tue, 30
 Aug 2022 17:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220826084001.3341215-1-badhri@google.com> <20220826084001.3341215-3-badhri@google.com>
 <Yw4J9wv1N2Z5/qbN@kroah.com>
In-Reply-To: <Yw4J9wv1N2Z5/qbN@kroah.com>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Tue, 30 Aug 2022 17:20:10 -0700
Message-ID: <CAPTae5KFmEXKLJD+A-adb7LpFVY3fDKjNXR8W_wBxDaBZkCa9g@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] usb: typec: tcpci_maxim: Export helper function
 for register reads
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks for the feedback ! Brain fade moment of not including commit message.
Not exporting symbols anymore and I have squashed the patch as well into
"[PATCH v2 3/3] usb: typec: maxim_contaminant: Implement
check_contaminant callback"
which I just sent out.

On Tue, Aug 30, 2022 at 6:00 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Aug 26, 2022 at 01:40:00AM -0700, Badhri Jagan Sridharan wrote:
> > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
>
> As Heikki pointed out, I can not accept changes with no changelog text
> at all, you know this.
>
> Please write a good changelog text that explains why you are doing this
> so we can properly review it.  As it is, we have no idea what is going
> on here at all.
>
> thanks,
>
> greg k-h
