Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39E3D55A7C0
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jun 2022 09:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232181AbiFYHdG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jun 2022 03:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232157AbiFYHdF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jun 2022 03:33:05 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D20FE015
        for <linux-usb@vger.kernel.org>; Sat, 25 Jun 2022 00:33:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 89A75B80D26
        for <linux-usb@vger.kernel.org>; Sat, 25 Jun 2022 07:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086D8C3411C;
        Sat, 25 Jun 2022 07:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1656142381;
        bh=NFlE+qSw/iCrfjUo11I4J4SaC5Gp2vFbUKgLLm7L7GM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VpJT1nntHydmcFv9TWPZ9M3Cg9fp0Ci96PCntICR48uXS3tQWt+e8NDx0vh0TRqT2
         Qo7g+/yH1dsBRHya14dWfNrrioYPn1Nj1/CaAhz/IPCmstpRCzQI7e/U0QOPuGP1RY
         Y28RlTcw89kprz+gu1PconagZZeQZq3tkWsdsH00=
Date:   Sat, 25 Jun 2022 09:32:55 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Chris Ruehl <chris.ruehl@gtsys.com.hk>
Cc:     Oliver Neukum <oneukum@suse.com>,
        "michael.lee@omron.com" <michael.lee@omron.com>,
        Lars Melin <larsm17@gmail.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: serial: usb: cdc-acm: OMRON B5L ToF, device probe failed
Message-ID: <Yra6Jw4uSSq2OJIZ@kroah.com>
References: <1af7ff05-8558-9162-a0cd-ac140ddaf2e1@gmail.com>
 <cbcc2071-5b56-025e-cae6-5af0210e2363@gtsys.com.hk>
 <OSZP286MB1776CCBCBFE38B25C7DB9978E1B39@OSZP286MB1776.JPNP286.PROD.OUTLOOK.COM>
 <40395457-0927-c169-7d9f-47d1912e2c39@suse.com>
 <f3aaf9e8-07c7-2c50-48c3-723c51f9445a@gtsys.com.hk>
 <dc9f9c31-b72d-0895-544a-13764538d991@suse.com>
 <3194ea30-34da-3d34-6d4a-08dc7c8d683a@gtsys.com.hk>
 <4f4977bf-6096-592c-9c06-44aacb82ccd7@gtsys.com.hk>
 <68fffa09-1522-bef0-f76e-610e2345a70c@suse.com>
 <85ff1357-5a70-3ee1-4098-08401f522c7a@gtsys.com.hk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85ff1357-5a70-3ee1-4098-08401f522c7a@gtsys.com.hk>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jun 25, 2022 at 10:35:54AM +0800, Chris Ruehl wrote:
> Disclaimer: https://www.gtsys.com.hk/email/classified.html

Now deleted.

Note, this does not work well with kernel development efforts :(
