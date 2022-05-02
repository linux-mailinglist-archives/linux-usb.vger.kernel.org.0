Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7902D516F40
	for <lists+linux-usb@lfdr.de>; Mon,  2 May 2022 14:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384880AbiEBMIN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 May 2022 08:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384879AbiEBMIK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 May 2022 08:08:10 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D51221408C
        for <linux-usb@vger.kernel.org>; Mon,  2 May 2022 05:04:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7ED30B816B3
        for <linux-usb@vger.kernel.org>; Mon,  2 May 2022 12:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28088C385AC;
        Mon,  2 May 2022 12:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1651493079;
        bh=pKzZvg7MpGzPlIun9lCbw3qGhh7M4H2uW4enE/m0eHk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vF263QpEmzh1ztiG5OLeeEjY4vEKFc6Gn3pHRLwytmFAJG5MW/YAn6GbwuN2TJSW4
         +rbHMOWHvDJSDNHbE/OGf8Be92lYyKJ8X4Pz57/VKbII8F9h6CScV+DESdtCcIJf6o
         XhdNJwxVNMZ2vVAcHdtZi93vsR4v0lLxzgM4nCDg=
Date:   Mon, 2 May 2022 14:04:38 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        marcel@holtmann.org
Subject: Re: [PATCH] Bluetooth: btusb: CSR chip hangs when unbound
Message-ID: <Ym/I1v094tX84nih@kroah.com>
References: <20220502070758.67396-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220502070758.67396-1-jtornosm@redhat.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 02, 2022 at 09:07:58AM +0200, Jose Ignacio Tornos Martinez wrote:
> Bluetooth Dongles with CSR chip (i.e. USB Bluetooth V4.0 Dongle by
> Trust) hang when they are unbound from 'unbind' sysfs entry and
> can not be bound again.
> 
> The reason is CSR chip hangs when usb configuration command with
> index 0 (used to unconfigure) is sent during disconnection.
> 
> To avoid this unwanted result, it is necessary not to send this
> command for CSR chip when usb device is unbound, so a new quirk
> has been created for this device.
> 
> Athough device is not unconfigured, it is better to avoid device
> hanging to be able to operate. Even bluetooth can be previously
> turned off.
> On the other hand, this is not important if usb device is going to
> be bound again (normal behavior), i.e. with usbip.
> ---

Also, the subject is totally wrong :(
