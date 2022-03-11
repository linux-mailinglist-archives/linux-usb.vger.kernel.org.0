Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A287C4D61C0
	for <lists+linux-usb@lfdr.de>; Fri, 11 Mar 2022 13:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348635AbiCKMuP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Mar 2022 07:50:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348605AbiCKMuO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Mar 2022 07:50:14 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CF4E1B65CD
        for <linux-usb@vger.kernel.org>; Fri, 11 Mar 2022 04:49:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D698461DC3
        for <linux-usb@vger.kernel.org>; Fri, 11 Mar 2022 12:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1802C340E9;
        Fri, 11 Mar 2022 12:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1647002950;
        bh=JBlRzZred/oUR64ruz3CETTAd+XuDm/eEh140IFSjTw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D4rQb612ZxVkn0RlVH2r/uhI2WLLkKZM/DgktrE770R2SjjUD5Y6fHVrEgoPQ9u2D
         Or8Vu9BMnWs3Ej+b62EhkSbiqt7HHws4S2yauVPoLP58RwuLspElaFzoIA9HTvN30E
         Apw1H+J2LhJNjT5zpbdqlhR5YcynH9+d7r3uPXjs=
Date:   Fri, 11 Mar 2022 13:49:07 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Neumann, Bastian" <Bastian.Neumann@dentsplysirona.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Richard Leitner <richard.leitner@skidata.com>
Subject: Re: [PATCH 1/2] usb: usb251xb: Set boost value for up- and
 downstream ports
Message-ID: <YitFQ3+ncz5EuP1i@kroah.com>
References: <PH0PR17MB48482AD591AFD471637B16E28E0C9@PH0PR17MB4848.namprd17.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR17MB48482AD591AFD471637B16E28E0C9@PH0PR17MB4848.namprd17.prod.outlook.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 11, 2022 at 12:09:40PM +0000, Neumann, Bastian wrote:
> -----------------------------------------------------------------------------------------------------------
> 
> 
> Diese E-Mail ist ausschliesslich fuer den angesprochenen Adressaten
> bestimmt und kann vertrauliche Informationen beinhalten.
> --
> This e-mail is intended only for the designated recipient(s). It may
> contain confidential or proprietary information.
> ------------------------------------------------------------------------------------------------------------

For obvious reasons, we can not take patches with email footers like
this, sorry.  Please fix your company IT systems.

Also, your patch is corrupted and can not be applied as all the tabs are
converted to spaces :(

thanks,

greg k-h
