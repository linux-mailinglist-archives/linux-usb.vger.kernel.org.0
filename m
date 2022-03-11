Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F42144D5EEC
	for <lists+linux-usb@lfdr.de>; Fri, 11 Mar 2022 10:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347520AbiCKJ6S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Mar 2022 04:58:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235035AbiCKJ6R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Mar 2022 04:58:17 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9B7F1BE4F3
        for <linux-usb@vger.kernel.org>; Fri, 11 Mar 2022 01:57:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6F988B826A3
        for <linux-usb@vger.kernel.org>; Fri, 11 Mar 2022 09:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FD4C340EC;
        Fri, 11 Mar 2022 09:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1646992632;
        bh=+TOmzf4r2QWgZAAJ7J/J5kQIQSV4QEilfFPuZX5T3N0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Bat9m5QwwBEFReulS82kbrIIWvHkp9COMEY5CMr74Qxi43hGXFn0AXfD1n/pzJveY
         nmJNGXFZabIamxeMX2Y5vfNtkoIZlXrJxdoYwHnNIA3KoCfxZUayADmA0QMqmcQSb1
         aE7qVIt+/+k1tDg81ocE8RluuAJ2ahPyNZN1WLKw=
Date:   Fri, 11 Mar 2022 10:57:09 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Neumann, Bastian" <Bastian.Neumann@dentsplysirona.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: usb251xb: Set boost value for up- and downstream
 ports
Message-ID: <Yisc9ZQReOH2yq7M@kroah.com>
References: <PH0PR17MB48487D4BC9BB0D3C38D8EED38E0C9@PH0PR17MB4848.namprd17.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR17MB48487D4BC9BB0D3C38D8EED38E0C9@PH0PR17MB4848.namprd17.prod.outlook.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 11, 2022 at 09:05:19AM +0000, Neumann, Bastian wrote:
> This patch adds devicetree properties to enable signal boosting on USB ports.
> 
> Signed-off-by: Bastian Neumann <bastian.neumann@dentsplysirona.com>
> ---
>  .../devicetree/bindings/usb/usb251xb.txt      | 22 +++++++++++++

You forgot to cc: the dt maintainers :(

