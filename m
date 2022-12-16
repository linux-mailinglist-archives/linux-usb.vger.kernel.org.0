Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF1B564E9D9
	for <lists+linux-usb@lfdr.de>; Fri, 16 Dec 2022 11:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbiLPK7M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Dec 2022 05:59:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230402AbiLPK7K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Dec 2022 05:59:10 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B7E31EE3
        for <linux-usb@vger.kernel.org>; Fri, 16 Dec 2022 02:59:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 02B1762063
        for <linux-usb@vger.kernel.org>; Fri, 16 Dec 2022 10:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0D83C433EF;
        Fri, 16 Dec 2022 10:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1671188348;
        bh=1p2DLwEcvTU6wfDto24xkGjMXKhZ+MvNmmOkJ/RIH9c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lEobJmP4c9SVqa+zv59urUQTjh07PhrCde4gz3D1IVQLdn9WRBmY43swCcpPJFMgN
         LyCLt3CfhvC7U6Zg86UFSqvFz22Uji3m358Vqww2jYnxk2jDL0iZrjIItB0y2KA3s8
         dBKp835evz29EVlChLpvOQbqvDvGvyHGUQR481BU=
Date:   Fri, 16 Dec 2022 11:59:00 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Artem Egorkine <arteme@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] sound: line6: correct midi status byte when
 receiving data from podxt
Message-ID: <Y5xPdLzobLFB7yTg@kroah.com>
References: <20221216100239.577805-1-arteme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221216100239.577805-1-arteme@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 16, 2022 at 12:02:38PM +0200, Artem Egorkine wrote:
> A PODxt device sends 0xb2, 0xc2 or 0xf2 as a status byte for MIDI
> messages over USB that should otherwise have a 0xb0, 0xc0 or 0xf0
> status byte. This is usually corrected by the driver on other OSes.
> 
> This fixes MIDI sysex messages sent by PODxt.
> 
> Signed-off-by: Artem Egorkine <arteme@gmail.com>
> ---
>  sound/usb/line6/driver.c  |  2 +-
>  sound/usb/line6/midi.c    |  2 +-
>  sound/usb/line6/midibuf.c | 42 +++++++++++++++++++++++++++++++--------
>  sound/usb/line6/midibuf.h |  2 +-
>  sound/usb/line6/pod.c     |  3 ++-
>  5 files changed, 39 insertions(+), 12 deletions(-)

You sent this to the wrong list and developers:

$ ./scripts/get_maintainer.pl --file sound/usb/line6/midibuf.c
Jaroslav Kysela <perex@perex.cz> (maintainer:SOUND)
Takashi Iwai <tiwai@suse.com> (maintainer:SOUND)
alsa-devel@alsa-project.org (moderated list:SOUND)
linux-kernel@vger.kernel.org (open list)

