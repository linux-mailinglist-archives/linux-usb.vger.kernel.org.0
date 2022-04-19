Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E22F5067B3
	for <lists+linux-usb@lfdr.de>; Tue, 19 Apr 2022 11:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350323AbiDSJbJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Apr 2022 05:31:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345428AbiDSJbI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Apr 2022 05:31:08 -0400
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9181F289A6
        for <linux-usb@vger.kernel.org>; Tue, 19 Apr 2022 02:28:26 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 2A792DF8A3
        for <linux-usb@vger.kernel.org>; Tue, 19 Apr 2022 02:28:26 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id pX3SJfbLTjZn for <linux-usb@vger.kernel.org>;
        Tue, 19 Apr 2022 02:28:25 -0700 (PDT)
Message-ID: <f03916f62a976fd10b9808f77eace9c230ca4ebc.camel@puri.sm>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=comms;
        t=1650360505; bh=6+7q/cdD8/wnf6tTiJt/j8KTaq+L4sXhuSVyLlMcYvo=;
        h=Subject:From:To:Date:From;
        b=T9GKlhYsE2gSSoEiPZ8FmGCRB79DMsk0dB+AwuYUxeXs4MQOGQhAPu6lgLa/XfBiu
         DRxCV6wJ180qWZJtNGd5KrbE2z2FALlxTzHrj8zuAMhFFy/EWDYsrXk5lkEg/4PThd
         Or1WRpXwhxV1luTvUzSnLTcyFgbz3D/CdxNMs7906MNTrmvPy/3AsRkQLvWIwvnjm+
         nXtLapt2giovERAjSuI0OJM5miA6PIsL/EAvihfhZ3kvng8RXUCxVMqttzg+onQDsp
         qbb7pVAlk85Y3ObYHTz/ULJKJif2FkFZolU4SvAD0MoOO7T378HxviZaRyZkvkBvbp
         /GItMBUEVx/Bw==
Subject: USB device disconnects on resume
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     linux-usb@vger.kernel.org
Date:   Tue, 19 Apr 2022 11:28:21 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

hi,

I'm seeing resets and re-enumerations on runtime-resume for one device
a lot. It's a modem connected to the USB2642 Microchip (SMSC) USB2 hub,
that's connected to an xhci HC.

A remote wakeup *sometimes* makes the hub say "physically disconnected"
during resume in hub_activate(), and thus sets reset_resume. Then the
device comes up as low-speed device once, which again is not allowed
during normal runtime resume, so would itself trigger a reset.

The Hub and device is permanently connected on the PCB, so the hub is
interpreting it in a wrong way. I found an email that describes what I
see from Sarah Sharp in 2013 here:
https://marc.info/?l=linux-usb&m=137754385421825&w=2 Where she says:

"Occasionally, the host controller was sending the SoFs too soon on
resume, and the device would interpret it as a low-speed chirp.  The
device would disconnect, and transform from a high speed device to a
low speed device.  I don't think increasing the 10 ms time out will
help at all in this case, but you did ask what USB device disconnect
scenarios I've seen."

I can't find any reference to that bug yet. Has anyone experienced
something (similar) and knows where I can at least try to work around
that?

I don't know Sarahs' current email, could we forward this question to
her?

thank a lot,

                             martin

