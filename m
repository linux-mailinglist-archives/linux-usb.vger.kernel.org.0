Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72045738A86
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jun 2023 18:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbjFUQL6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jun 2023 12:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjFUQL5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jun 2023 12:11:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26502F1
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 09:11:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B785F615C9
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 16:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B45FC433C0;
        Wed, 21 Jun 2023 16:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687363916;
        bh=nRUxlLmqCMRWyn2OIntHw8jhX3zQGJ1FEOwYU+Y1MMQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IMvBF4qjZFr2KUAhQ4oVN6VvrBfnbU20rQA3if7lNx7HMpDLcpqx9UvamyW8YkKSV
         EHNC8azXQcEqHiLv90yOomVAkOLISH7ue5LcDeL5bF5psb8NOhPN2FIM9PAwrsMv/Q
         FFOk35O0HMiFy6bhSPfyG984ur69BgIPrmVZANyLQdBD2WWuUGhvMkEx0pPTWbQN2C
         Uh0mpA5c2HoSl/1zjBeWOabBmRzGG8Y3w+bA00dFurG+whby2AqkLvAxrZXvWrmjGU
         vqgHkeKmYJ00QmP6NGu2iMnjAFmvCpYpO6sO79vD+gRtvAABnJtwFJoFQ8Af78wE/b
         PFasgluhPz9Jw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1qC0R5-0003fV-3a; Wed, 21 Jun 2023 18:11:59 +0200
Date:   Wed, 21 Jun 2023 18:11:59 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Davide Tronchin <davide.tronchin.94@gmail.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        marco.demarco@posteo.net
Subject: Re: [PATCH] USB: serial: option: add u-blox LARA-R6 01B modem
Message-ID: <ZJMhT0ahToMBWISk@hovoldconsulting.com>
References: <ZJK9us5skqZHmawa@hovoldconsulting.com>
 <20230621125314.7725-1-davide.tronchin.94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621125314.7725-1-davide.tronchin.94@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 21, 2023 at 02:53:14PM +0200, Davide Tronchin wrote:
> > > The first 4 interfaces of all the 3 configurations (default, RMNET, ECM)
> > > are the same.
> > > Here below you can find debug/usb/devices file of the LARA-R6 01B module
> > > in all the USB configurations.
> 
> > Thanks, can you include this in the commit message for v2 as well?
> 
> Sure.
> 
> > Right, I had USB_DEVICE_INTERFACE_CLASS() in mind for the ECM
> > configuration. That should avoid the need for RSVD().
> 
> If possible, i would use USB_DEVICE_INTERFACE_CLASS() for all the
> R6 01B USB configurations. Something like:
> 
> { USB_DEVICE_INTERFACE_CLASS(UBLOX_VENDOR_ID, 0x1311, 0xff) },
> { USB_DEVICE_INTERFACE_CLASS(UBLOX_VENDOR_ID, 0x1312, 0xff),
>   .driver_info = RSVD(4) },
> { USB_DEVICE_INTERFACE_CLASS(UBLOX_VENDOR_ID, 0x1313, 0xff) },
> 
> Reservation is required for RMNET on port 4, as the RMNET port also 
> has USB interface class 255:
> 
> If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
> If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=qmi_wwan
> 
> What do you think?

That should work, but I don't think you should use more specific
matching than required either. So I'd suggest sticking with USB_DEVICE()
for the other two configurations.

Johan
