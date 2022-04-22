Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1E7850B317
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 10:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244977AbiDVInI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 04:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445703AbiDVInI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 04:43:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF4BD3ED3D
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 01:40:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 91A75B82A8A
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 08:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FCCC385A0;
        Fri, 22 Apr 2022 08:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650616813;
        bh=j2ewYUDqa59B9EJyYbUeyxswWr3CILSMnSORiS5yN08=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H/s4wuPr/SY3meyZxZA0+JhB7k6sS0nRNMU1sIKriFHE3/oYdySByCXN4wCFXdi1Q
         FOsBuCfywNbQ5b984PbQeM7PuGfBlwTa9cF7dfB5pnI7rWXPk9EYG17xC8RteEO8d8
         KgAneVoP4CI96O3R+dpj7FQVS9Mia7z4Ru6uRSPo=
Date:   Fri, 22 Apr 2022 10:40:10 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH v6 4/5] usb: gadget: add trace event of configfs
 link/unlink operation
Message-ID: <YmJp6vkNRjXTVjPN@kroah.com>
References: <1649294865-4388-1-git-send-email-quic_linyyuan@quicinc.com>
 <1649294865-4388-5-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649294865-4388-5-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 07, 2022 at 09:27:44AM +0800, Linyu Yuan wrote:
> Add API trace_usb_configfs_link/unlink_group() to trace user space
> link/unlink a group like add function to configuration or
> remove function from configuration.
> If a specific function need link/unlink, it also can be used.

Doesn't configfs have generic trace functions like this?  What is this
going to show you?  Userspace is the thing causing these events to
happen, why do you need trace events for any of these configfs things?

Who is going to use this, and what are they all going to be used for?

thanks,

greg k-h
