Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D74C6D330B
	for <lists+linux-usb@lfdr.de>; Sat,  1 Apr 2023 20:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbjDASHE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Apr 2023 14:07:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjDASHD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Apr 2023 14:07:03 -0400
Received: from lithium.sammserver.com (lithium.sammserver.com [168.119.122.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 294B81E716
        for <linux-usb@vger.kernel.org>; Sat,  1 Apr 2023 11:06:59 -0700 (PDT)
Received: from mail.sammserver.com (sammserver.wg [10.32.40.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by lithium.sammserver.com (Postfix) with ESMTPS id 8415631181CE;
        Sat,  1 Apr 2023 20:06:57 +0200 (CEST)
Received: from mail.sammserver.com (localhost.localdomain [127.0.0.1])
        by mail.sammserver.com (Postfix) with ESMTP id 2ED89426A1;
        Sat,  1 Apr 2023 20:06:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cavoj.net; s=email;
        t=1680372417; bh=kmODjcGdNCKg6EDL7PEgnQONR/xcW59Ve11otIrjcNw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nWNv3HilJvPrbgfnkUaCwlT1JSZcnKm9+uo1wXOGB6VnQVeyFj0DrdQODYEpMHUSp
         juQBhxk5c0asgcDxLFExUnK7K/WZfHZWTepArzt/OUxu9C/9CuYeSemfDq7X3132v/
         Ont1ZhzzTtlsInuIyGBslvCjO0BtNwuV3adovDPI=
MIME-Version: 1.0
Date:   Sat, 01 Apr 2023 20:06:57 +0200
From:   =?UTF-8?Q?Samuel_=C4=8Cavoj?= <samuel@cavoj.net>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: introduce read_explicit operation
In-Reply-To: <ZCWXZ1KwzYeSdJhv@kuha.fi.intel.com>
References: <20230120233920.752245-1-samuel@cavoj.net>
 <Y8uRnc3Cxb1ADad6@kroah.com> <Y8+/Lgp7fWaxFsri@kuha.fi.intel.com>
 <ZAi1KO+WUs+9nNOn@kuha.fi.intel.com> <ZBMUsweZjfqxZJdc@kuha.fi.intel.com>
 <c5223adc99dd9bf849071e8fdfed4bb1@cavoj.net>
 <3ae633095973c747baea1a23f3b7f6f4@cavoj.net>
 <ZCWXZ1KwzYeSdJhv@kuha.fi.intel.com>
Message-ID: <3525bf85c78a5805c4b4bff42dd49c39@cavoj.net>
X-Sender: samuel@cavoj.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> 
> Okay... Did you see those errors with your original patch?

I'm pretty sure that it's the same, yeah. The specific error is
one (or a seemingly random sequence) of the following:

- con2: failed to register partner alt modes (-22)
- con2: failed to register partner alt modes (-5)
- GET_CURRENT_CAM command failed (also caused by a -22 from 
exec_command)

Doesn't occur with nothing or only a charger plugged in. Once I plug
a USB-C to DP adapter or a cheap USB-C hub (with an internal DP->HDMI
converter, USB3 hub and GbE in one of the hub ports), the errors
randomly show up when reloading the module or when plugging in once
already loaded. Not consistent at all.

So seems to be alt-mode related. Will probably need some more
investigation on my part, unless you've got any ideas off the
bat.

Sam
