Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4A2E6B7B71
	for <lists+linux-usb@lfdr.de>; Mon, 13 Mar 2023 16:04:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbjCMPE1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Mar 2023 11:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbjCMPE0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Mar 2023 11:04:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 541F029E24
        for <linux-usb@vger.kernel.org>; Mon, 13 Mar 2023 08:03:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BC18A6132D
        for <linux-usb@vger.kernel.org>; Mon, 13 Mar 2023 15:03:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F470C433EF;
        Mon, 13 Mar 2023 15:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678719823;
        bh=h4KaDjIje2H4z6h7AqOLQLBJI8Yxp5CKMyTIsJEgAO0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NvyDZA5T7GE8UWSVzFnmwZz31yTuMOkHIcONTQ6vEGnK95qzNjIoQOvt1MAPJPuEr
         W7M38a7wz1Ww0onzBH4wjEDc4oqZFc08CrN2u6XWJosmq7hhZrvW45wltEdOzojF3x
         FuX/Tk/EhHicIVIpLES9lNz7Iigt2KCf7ozHotb6VVC+JyC806Bpk3mgkfODtvidTr
         QIqGQpcoKOKW7rEwfYrt5cAUitUbJfLgoI1RsgwYcVu1XY2FQxKbspZvsQ4R6uddSC
         aE0IAqErW5aDzEg9d2leIJm1roXN01hpoHCnvrsAfD4dylwSWIMLnOE0zrTRMYWIxh
         ESrtAkUO4u9pg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pbjjA-0004gy-9c; Mon, 13 Mar 2023 16:04:44 +0100
Date:   Mon, 13 Mar 2023 16:04:44 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Kees Jan Koster <kjkoster@kjkoster.org>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: cp210x: add Silicon Labs IFS-USB-DATACABLE
 IDs
Message-ID: <ZA87jMR8qx6YfBVQ@hovoldconsulting.com>
References: <20230218141830.5612-1-kjkoster@kjkoster.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230218141830.5612-1-kjkoster@kjkoster.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Feb 18, 2023 at 03:18:30PM +0100, Kees Jan Koster wrote:
> The Silicon Labs IFS-USB-DATACABLE is used in conjunction with for example
> the Quint UPSes. It is used to enable Modbus communication with the UPS to
> query configuration, power and battery status.
> 
> Signed-off-by: Kees Jan Koster <kjkoster@kjkoster.org>

Now applied, thanks.

Johan
