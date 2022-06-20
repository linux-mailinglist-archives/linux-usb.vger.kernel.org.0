Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1495551457
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jun 2022 11:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240756AbiFTJ3C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jun 2022 05:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240819AbiFTJ2m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jun 2022 05:28:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A701411839
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 02:28:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 52B97B80FC0
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 09:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00710C341C6;
        Mon, 20 Jun 2022 09:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655717319;
        bh=A1tzUc+OBHQC9EZ3LtwiF2RoasSL/g4hSRVv0uCIjDc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ugMAkYjU981NeZ8yN8hxO7Dd87tEm7RLldcPD+GPAiak2yLg8IeNypG2xW5pOPNt1
         F3YLTO1FUvpg0Ff0l0W5i8ZTOSJmuuoXm3LzopbWFA5pUUvIY6STNPnEVT/NI/8Wbf
         sdCSN8m26Oj5yLxfjmnUcXUdHgurlOfcXkdUr6Voixe/wMROj1W/WuVqijpSXSr7r1
         hwlRi3JAmVLm+or17FHnr+iYvCySyBA9PhZs+wU3SmWtJqye1YskFHFPFu2vM+yHAn
         TSddIsIjFpF8XBp+4Cs3cYII1zJhyqt+Ht/g3jjdgB/1Y1LDFG1HxiSigjRRZ4hI+Q
         qYV8YdpynUzvQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1o3Dhy-0007y8-Os; Mon, 20 Jun 2022 11:28:35 +0200
Date:   Mon, 20 Jun 2022 11:28:34 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: question on when to call usb_serial_handle_dcd_change()
Message-ID: <YrA9wuf07wkw8Nke@hovoldconsulting.com>
References: <34305c4b-5973-f690-d3b3-e1b09ce1ce95@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34305c4b-5973-f690-d3b3-e1b09ce1ce95@suse.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 14, 2022 at 04:29:40PM +0200, Oliver Neukum wrote:
> Hi,
> 
> can this be called unconditionally, that is even for a closed tty?

It looks like that would be ok, but why would you do so?

Johan
