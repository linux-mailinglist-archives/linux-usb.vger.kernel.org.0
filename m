Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A78B5081E9
	for <lists+linux-usb@lfdr.de>; Wed, 20 Apr 2022 09:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359667AbiDTHX3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Apr 2022 03:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359662AbiDTHX2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Apr 2022 03:23:28 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9861A25C5F
        for <linux-usb@vger.kernel.org>; Wed, 20 Apr 2022 00:20:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id E0E88CE1C33
        for <linux-usb@vger.kernel.org>; Wed, 20 Apr 2022 07:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382C7C385A1;
        Wed, 20 Apr 2022 07:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650439240;
        bh=sADFl038bQdXB017XGFd9vnCTHD7TNCvCf/2BYGKHSA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tWtnCHJBGHWJOEo4iXkV3snrPccnZBBGpCWL4bg8XZOF6TzkoSMB36V39F+Y7gMdc
         iKp6alwG+kCL1hSMMNP+b5daNNjTpx0KLshkLa1QQCLSEztSo6JmP9qZBvqjBpTE7m
         kDxq9qbwDZd7VeWQUUVCzZN7aAoHdSKTCd/I9ArzwUWLxg8CX90RZshiGz6fsfR/Gu
         J3UnU0uLIr4Qn4OVhvITvIInCZe/jRb/WW6GwOa8ZlEJOmlWK0OVze0MAkED4NtMu2
         rsAveMekF0FjQNR2c1m7GJtcoquH6byflLg15YrqpopE1AFyHRcNGXlRSB1X2T2Vir
         oGJ68wgZe8qpA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1nh4dc-0002MH-KT; Wed, 20 Apr 2022 09:20:32 +0200
Date:   Wed, 20 Apr 2022 09:20:32 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] USB: serial: cp210x: add PIDs for Kamstrup USB Meter
 Reader
Message-ID: <Yl+0QKi1k+JTSP4H@hovoldconsulting.com>
References: <20220414081202.5591-1-bruno.thomsen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414081202.5591-1-bruno.thomsen@gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 14, 2022 at 10:12:02AM +0200, Bruno Thomsen wrote:
> Wireless reading of water and heat meters using 868MHz wM-Bus mode C1.
> 
> The two different product IDs allow detection of dongle antenna
> solution:
> - Internal antenna
> - External antenna using SMA connector
> 
> https://www.kamstrup.com/en-en/water-solutions/water-meter-reading/usb-meter-reader
> 
> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>

Now applied, thanks.

Johan
