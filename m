Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6377678D8BE
	for <lists+linux-usb@lfdr.de>; Wed, 30 Aug 2023 20:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233930AbjH3SbM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Aug 2023 14:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243416AbjH3K4o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Aug 2023 06:56:44 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC6491BF
        for <linux-usb@vger.kernel.org>; Wed, 30 Aug 2023 03:56:41 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0c:5a83:9103:1700:2f0:bfeb:cfb7:701b])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: rcn)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 863646607243;
        Wed, 30 Aug 2023 11:56:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1693393000;
        bh=6n1Wt8QX8dwZ7zVsaDnmla2xKFVLfRlfUKS/zIqx9k0=;
        h=From:To:Cc:Cc:Subject:References:In-reply-to:Date:From;
        b=kGv7K3degzeEEoBTouRuOZCU7yVhxvo6aVYOLe5Sj8Frbz9m4/8MwZAdtgzm/d5E5
         +1w+LoF32bCXnqZVl3/gYlLIWY6pJVaKH5Tc3b/s8yq+HwE+I6nEt6NhvGsmkKwuLm
         5BKjjaNNALhHovk3Xr3EE63TbUmHD/IBHsLZkBNmfwONleEoCBCfgZ5cneUFzDYHAN
         FTZMSptEkD7vmJoz7Vwo3KBV4DjA+TmsrL69GQS+LGBZnsd0zywWIws1r/6jJn1POO
         is4cxtHrdai7w4F6gF8A4bwN6xcIMvzuACuSstGyrb7LtrxFWGTjBnn8oFelui0SFV
         tPDqfIkcYqicw==
From:   Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        linux@roeck-us.net, kernel@collabora.com
Subject: Re: [PATCH] usb: hub: Guard against accesses to uninitialized BOS descriptors
References: <20230830100418.1952143-1-ricardo.canuelo@collabora.com> <2023083007-vowed-latitude-acef@gregkh>
In-reply-to: <2023083007-vowed-latitude-acef@gregkh>
Date:   Wed, 30 Aug 2023 12:56:37 +0200
Message-ID: <87h6oghk7u.fsf@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg, thanks for reviewing.

On mi=C3=A9, ago 30 2023 at 12:13:44, Greg KH <gregkh@linuxfoundation.org> =
wrote:
> Did you mean to loose the indentation here?

This output has probably gone through some processing before I got it,
so that's likely the cause. I don't have access to the original output,
sorry. If I need to fix something for a v2 I can try to re-format it to
add the indentation back in.

> What commit id does this fix?

This isn't linked to a particular single commit, it fixes the same
problem in different parts of the code, introduced by different commits
over time. The starting point for the fix was the crash output in the
commit message but, for additional context, these are the original
commits that introduced the unguarded struct accesses:

  0cdd49a1d1a4 ("usb: Support USB 3.1 extended port status request")
  51e0a0120661 ("USB: Calculate USB 3.0 exit latencies for LPM.")
  25cd2882e2fc ("usb/xhci: Change how we indicate a host supports Link PM.")
  0299809be415 ("usb: core: Track SuperSpeed Plus GenXxY")
  ae8963adb4ad ("usb: Don't enable LPM if the exit latency is zero.")

Cheers,
Ricardo
