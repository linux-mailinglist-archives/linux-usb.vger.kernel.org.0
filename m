Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3342FE774
	for <lists+linux-usb@lfdr.de>; Thu, 21 Jan 2021 11:23:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729169AbhAUKW1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Jan 2021 05:22:27 -0500
Received: from mail-03.mail-europe.com ([91.134.188.129]:44270 "EHLO
        mail-03.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729117AbhAUKWS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Jan 2021 05:22:18 -0500
Date:   Thu, 21 Jan 2021 10:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1611224443;
        bh=NS6jIL1HjYTGB056Lzh6PU4kdZhf+ynx4UsW9FFdNJE=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=ungU9saH7Fmh3X9R6YqzPltWK/RnLGdSoGiVod8zlF6rBH4UNt8uca423m4EesFHq
         T4d7Dnn9vOHjteazVmNvxiGQ0vetkeoZJmX3YBOUwm5X/cbRAZ2H7LnTqJ/SQukpnY
         QYZZAw1qxRKDYkap37EcsFS+J27SdiduurgBphK4mtmn+/ffw2kcmKoaBnCOFMtifN
         JCHKqhbtkX2qs7Va4hsQnAcfnxPOz7LE4y17Ng/vCF+uZA67bZ3tHIy634fnE+yjV8
         b+xYBDlN43G1D8TbEWcZAU+YYWwDbBbYQPeCaE0Xon8QmpmauA9zNCNPxMkz5SPmGA
         sAfss8vVAM9AA==
To:     Thomas Zimmermann <tzimmermann@suse.de>
From:   Simon Ser <contact@emersion.fr>
Cc:     =?utf-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
        dri-devel@lists.freedesktop.org, hudson@trmm.net,
        markus@raatikainen.cc, peter@stuge.se, linux-usb@vger.kernel.org,
        th020394@gmail.com, lkundrak@v3.sk, pontus.fuchs@gmail.com,
        sam@ravnborg.org
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v4 0/3] Generic USB Display driver
Message-ID: <-aBHMpNW0jmn4TF7fGiParPvZuVdzM0H0UGlmc0KGpZYJlBGkL-xq0ooPGErY0gl9iF9C7Il5jfFApcYHfypL06iv-6knlp7B6D7HfBhANc=@emersion.fr>
In-Reply-To: <ebda4ea3-3352-f35f-883e-6db751d6ca8b@suse.de>
References: <20210120170033.38468-1-noralf@tronnes.org> <ebda4ea3-3352-f35f-883e-6db751d6ca8b@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thursday, January 21st, 2021 at 10:59 AM, Thomas Zimmermann <tzimmermann=
@suse.de> wrote:

> Well, I'd strongly ask to not call it "generic", because it isn't. We
> have other USB drivers and anyone can make a USB display with these
> protocols as well. That doesn't make them generic. A USB-standardized
> protocol would be generic. Maybe call it custom, or home-made.

Maybe rename it to "GUD USB Display driver"? :P
