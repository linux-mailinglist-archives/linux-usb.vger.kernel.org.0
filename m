Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7930A65D786
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 16:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232953AbjADPtP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 10:49:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239544AbjADPtG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 10:49:06 -0500
Received: from bee.tesarici.cz (bee.tesarici.cz [IPv6:2a03:3b40:fe:2d4::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE155395C2
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 07:49:04 -0800 (PST)
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by bee.tesarici.cz (Postfix) with ESMTPSA id 27A8912D540
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 16:49:02 +0100 (CET)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
        t=1672847342; bh=WoGXT9GVmTY+VSLibsg7xv0yQeCiIAGBsfe3lYiVgiY=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=omaDsVTbyhXXOumXQYiPqdtKr+Fg6WPxKu9kf0sa8tTT2pla+Bhyjja3OYrogglID
         f0SthHTQep2sG0pp2e3NpKZGOlwq3rHlKiD5xrVeB0ZF4nWzRcetrjyTP+0qF3gAEj
         FeAU/i49YtyeCAuNJqmqwgXP94R/gJZ3ICyg3jMEby0sMDQZVhhBH1suRWTGzLLNFa
         mTfY4nJazyw4Q8bUq0sIvL3RCfKUmrjkqhypeUmWMnHAhaysX7t5/wVAiVD5uWod/B
         nRCqvNtjeF1wxVaL+7WFLBTnxvIbJEnkQ1fKGP2i3TepEBUv2mHmtrDLYyKVv3V+oJ
         QsnK5q8FNRxMA==
Date:   Wed, 4 Jan 2023 16:49:00 +0100
From:   Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To:     <linux-usb@vger.kernel.org>
Subject: Re: Disabling per-device autosuspend
Message-ID: <20230104164900.31a3243d@meshulam.tesarici.cz>
In-Reply-To: <20230104151341.6f937c0c@meshulam.tesarici.cz>
References: <20230104151341.6f937c0c@meshulam.tesarici.cz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 4 Jan 2023 15:13:41 +0100
Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> wrote:

> Hi folks,
>=20
> I'm struggling with autosuspend on my Samsung phone in download mode,
> as it apparently breaks heimdall/libusb on my Tumbleweed system. Here's
> what I'm seeing:
>=20
> - My device is autosuspended, because it has been idle for long enough.
> - cd /sys/bus/usb/devices/1-4/  # my device's port
> - echo -1 > power/autosuspend
> - The device is reset and gets a new device ID.
>   The current directory is no longer valid (becomes empty).

On a second thought, this looks like the actual bug. I don't think
we're supposed to see a disconnect+reconnect whenever a suspended USB
device is resumed. Then again, I'm no expert on USB...

Petr T
