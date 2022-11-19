Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5963A630D94
	for <lists+linux-usb@lfdr.de>; Sat, 19 Nov 2022 09:51:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbiKSIvh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 19 Nov 2022 03:51:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiKSIvf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 19 Nov 2022 03:51:35 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7459D7614D
        for <linux-usb@vger.kernel.org>; Sat, 19 Nov 2022 00:51:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A09C4B81A6E
        for <linux-usb@vger.kernel.org>; Sat, 19 Nov 2022 08:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A21C433D6;
        Sat, 19 Nov 2022 08:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1668847890;
        bh=2eiYPexK1pyjvGNSH9E6EANVriOuFpFM27/MXqKCo6c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M5nBuRaGUkw+N4M5J15ltqZO6do5x14EOyL6yj5gJQ7H9pUvWFQWgA7it16zxrKAY
         L7ClmXyN9q4VUXAuyYDL/ZtP762tG3klEHcQeUK9NykmEEf96A8ad+fV867Eoqqcde
         QMe/abW1RAtluRbZIU/uvD27707N1vLgoE0BrmZw=
Date:   Sat, 19 Nov 2022 09:51:28 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: roles: fix of node refcount leak in
 usb_role_switch_is_parent()
Message-ID: <Y3iZEPliYaEnPBJ+@kroah.com>
References: <20221118141850.806564-1-yangyingliang@huawei.com>
 <Y3fHom6pvHT+dD5k@kroah.com>
 <84ac82b3-5785-e879-8a36-3123683b4e83@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84ac82b3-5785-e879-8a36-3123683b4e83@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Nov 19, 2022 at 03:47:33PM +0800, Yang Yingliang wrote:
> 
> On 2022/11/19 1:57, Greg KH wrote:
> > On Fri, Nov 18, 2022 at 10:18:50PM +0800, Yang Yingliang wrote:
> > > I got the following report:
> > > 
> > >    OF: ERROR: memory leak, expected refcount 1 instead of 2,
> > >    of_node_get()/of_node_put() unbalanced - destroy cset entry:
> > >    attach overlay node /i2c/pmic@34
> > report from what?  What generates this?
> I got this report while doing loading device (mt6370-tcpc) test
> with CONFIG_OF_UNITTEST and CONFIG_OF_DYNAMIC enabled.

Please include that in the information in the changelog text and
resubmit a v2.

thanks,

greg k-h
