Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC93576DDBE
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 03:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbjHCB6p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Aug 2023 21:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230369AbjHCB6K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Aug 2023 21:58:10 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id B9CD130FB
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 18:56:10 -0700 (PDT)
Received: (qmail 226884 invoked by uid 1000); 2 Aug 2023 21:56:09 -0400
Date:   Wed, 2 Aug 2023 21:56:09 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Ron <ronald.du.igt.linuxml@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: GadgetFS ep0 OUT transactions immediately following SETUP
 transactions
Message-ID: <23a2c177-491e-416d-9e52-2c145f0264f3@rowland.harvard.edu>
References: <CAHA0pnyBgFPbU0X6Ywe28ERcKcoB2LwfVEju6RXCS3SMRZS_RQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHA0pnyBgFPbU0X6Ywe28ERcKcoB2LwfVEju6RXCS3SMRZS_RQ@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 02, 2023 at 04:43:53PM -0700, Ron wrote:
> Hello everyone,
> 
> Thank you all for the help!
> 
> I'm trying to modify the GadgetFS kernel driver to be able to handle
> Vendor Specific Out requests to ep0. All of these transactions are
> occuring on ep0. Right now the host is sending the SETUP transaction,
> then an OUT transaction with vendor specific data, which is followed
> by the device sending an IN transaction to acknowledge the whole
> request. When polling the ep0 file descriptor in userspace, I can
> receive the Vendor Specific SETUP transaction and the respective
> bRequest, wValue, etc values from the SETUP transaction. However, I
> can't figure out how to also get the data from the OUT transaction
> into userspace.

You just read that data from the ep0 file descriptor, same as you read 
the SETUP information (except that this data won't be encapsulated in 
a usb_gadgetfs_event structure).

>  I have tried modifying inode.c for gadgetFS but am not
> sure where to begin to do this.

No modifications should be needed.

Alan Stern
