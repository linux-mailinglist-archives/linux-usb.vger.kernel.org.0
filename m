Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9189862FC1B
	for <lists+linux-usb@lfdr.de>; Fri, 18 Nov 2022 18:58:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242154AbiKRR6G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Nov 2022 12:58:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242261AbiKRR6E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Nov 2022 12:58:04 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 056F1720B3
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 09:57:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5C7B0626B8
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 17:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E9FC433C1;
        Fri, 18 Nov 2022 17:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1668794277;
        bh=u6YGyx6uho1amF69HanW4pVRDwmLEGA2TJFHFqgXoLA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vuujVRAjn4AzcyHQAA8B2N2oEb8gSUcTjGivk1xkL2axZpuonUKL2IddwhK+Ay42K
         310Kb/tAiPW9BGuSgwW/ClmuzPCNzl8Ba3gGvFo6eqQf7oQsYtbCSQj8D6tfJmvllp
         66SDZk/qwqSv8UtSjrfnyeU7s6KhVatKs75VsnEY=
Date:   Fri, 18 Nov 2022 18:57:54 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: roles: fix of node refcount leak in
 usb_role_switch_is_parent()
Message-ID: <Y3fHom6pvHT+dD5k@kroah.com>
References: <20221118141850.806564-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118141850.806564-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 18, 2022 at 10:18:50PM +0800, Yang Yingliang wrote:
> I got the following report:
> 
>   OF: ERROR: memory leak, expected refcount 1 instead of 2,
>   of_node_get()/of_node_put() unbalanced - destroy cset entry:
>   attach overlay node /i2c/pmic@34

report from what?  What generates this?

