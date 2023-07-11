Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D25074F8CB
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jul 2023 22:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231706AbjGKUMJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jul 2023 16:12:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjGKUMI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Jul 2023 16:12:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7991D12F
        for <linux-usb@vger.kernel.org>; Tue, 11 Jul 2023 13:12:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0EF4D615E3
        for <linux-usb@vger.kernel.org>; Tue, 11 Jul 2023 20:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B42DC433C7;
        Tue, 11 Jul 2023 20:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689106326;
        bh=MdUZCeeACrV8lco8xyZoWWdINdlukQxVGZTpoYXp6p8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=m9M7R6kX71CNU0VZH2rXNxmpcxlYVKMeYYYJLFYVO0Mw+J7PJ3GHvC7nMZW9lpjW2
         ELz43uOuJVVsC3Zoa8MsCUyNY+FclFXEpmGldE3RkIPOnDYZHYM5sAWDktQjhsPdNh
         T79DdgZgK5kOiivDsRLh7Wsv/dKha6xjrSQLP294bgSJKnn/8dFATGNdc617BODjNB
         Lpnx0p2VQlbU6JBkv8yWDGF4dLRaPKi/FxIaR7HDla3bSx/P2rZy06Ibl9fMF9RMW+
         UKGRIMjjoV6HSr5r2/iRiSfU+7l4V094NWif5n4TWSeH6SEGY8T4yCuSObKjj/9f9E
         cVD5LTMDXWnvA==
Date:   Tue, 11 Jul 2023 13:12:05 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Oliver Neukum <oneukum@suse.com>, netdev@vger.kernel.org,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] net: usbnet: Fix WARNING in
 usbnet_start_xmit/usb_submit_urb
Message-ID: <20230711131205.53b3e5e4@kernel.org>
In-Reply-To: <38ff51d4-2734-4dd7-8638-ae2fc8572c0d@rowland.harvard.edu>
References: <000000000000a56e9105d0cec021@google.com>
        <000000000000e298cd05fecc07d4@google.com>
        <0f685f2f-06df-4cf2-9387-34f5e3c8b7b7@rowland.harvard.edu>
        <7330e6c0-eb73-499e-8699-dc1754d90cad@rowland.harvard.edu>
        <413fb529-477c-7ac9-881e-550b4613d38c@suse.com>
        <38ff51d4-2734-4dd7-8638-ae2fc8572c0d@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 11 Jul 2023 13:38:00 -0400 Alan Stern wrote:
> +		u8		ep_addrs[3] = {
> +			info->in + USB_DIR_IN, info->out + USB_DIR_OUT, 0};

With the two-tab indentation and the continuation line starting
half way thru.. this looks highly unusual. Can we use a more
standard kernel formatting in this case?

		u8 ep_addrs[3] = {
			info->in + USB_DIR_IN, info->out + USB_DIR_OUT, 0
		};
-- 
pw-bot: cr
