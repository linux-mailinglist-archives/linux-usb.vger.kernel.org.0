Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB3C365515F
	for <lists+linux-usb@lfdr.de>; Fri, 23 Dec 2022 15:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230448AbiLWO0I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Dec 2022 09:26:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbiLWO0G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Dec 2022 09:26:06 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA0C910FE0
        for <linux-usb@vger.kernel.org>; Fri, 23 Dec 2022 06:26:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 88DF2B82047
        for <linux-usb@vger.kernel.org>; Fri, 23 Dec 2022 14:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB5BAC433EF;
        Fri, 23 Dec 2022 14:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1671805563;
        bh=7x95NZjJND6rlHK1wzfYvhDyWg68x90rK1oa6NFGPSo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qyQRpBfs2w35GKjAOshcRINU2ZTdRsalUD2vI6Kg9hDGL9+xpz7nWIeUbuSsJ5wGQ
         DFzldAXfCI8U4btzYPKp3q6XUQjYkQdw8+EHfGeHaU94/tBMEFTbNlc3keiKAM7vRO
         3taLnsdQ/GqZKxznz4/5+AeTiQLw1JRBzq6CpbFI=
Date:   Fri, 23 Dec 2022 15:26:00 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: SMMU Fault after setting RUN_STOP during gadget_pullup
Message-ID: <Y6W6eF7lDSp/bssp@kroah.com>
References: <fa94cbc9-e637-ba9b-8ec8-67c6955eca98@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa94cbc9-e637-ba9b-8ec8-67c6955eca98@quicinc.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 23, 2022 at 07:26:49PM +0530, Krishna Kurapati PSSNV wrote:
> Hi all,
> 
> I am facing one SMMU fault with FAR=0x00 on current targets running on 5.10
> and 5.15 with following signature:

What about 6.1?

thanks,

greg k-h
