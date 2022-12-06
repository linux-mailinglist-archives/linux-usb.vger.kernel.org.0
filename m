Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C90A564446E
	for <lists+linux-usb@lfdr.de>; Tue,  6 Dec 2022 14:17:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232604AbiLFNR3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Dec 2022 08:17:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235217AbiLFNRS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Dec 2022 08:17:18 -0500
Received: from h2.cmg1.smtp.forpsi.com (h2.cmg1.smtp.forpsi.com [81.2.195.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08A1921C
        for <linux-usb@vger.kernel.org>; Tue,  6 Dec 2022 05:17:14 -0800 (PST)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id 2Xoqpl95JPm6C2XorpDD1b; Tue, 06 Dec 2022 14:17:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1670332630; bh=GqSJOeghA8W8mo11jILaQIx87BJR/+I2RE5VHJ2kr5I=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=DYu10/1F653qO6Jxp5L+xHcLMPv6imQA//GXfZQRf7Zb9RGBCtZhHHVbuuc1oIYLw
         Rwhy5jU5XRC5Ovl+YnBZ86IKgbe5eusoJOK0U9eNY/WVlhwJJILfrNoKB2GXtS5Kja
         6V15rfDHF1HEMmF9+m3baNGvW05yC1MHW8KcvHPyjGaWUsXpB+zKg8sGvx4BwyjtAx
         2u73B69ltzT7QekId9YaLC+EB1K4cN7bRM+Th5mjyE5ub95PeMROXs7fwM6+wqrtyu
         r7lnXeo2kADZMbbLyLaRHK8bVxwYDk0WtTN5JcuafAUDxjtVr1Jvaj+5QKOj0E3FYD
         1IhpClBcvWPzw==
Date:   Tue, 6 Dec 2022 14:17:08 +0100
From:   Ladislav Michl <oss-lists@triops.cz>
To:     linux-usb@vger.kernel.org
Subject: Re: xHCI host dies on device unplug
Message-ID: <Y49A1Pv6dUScQ9x/@lenoch>
References: <Y45iXb6VCNiz7ZVd@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y45iXb6VCNiz7ZVd@lenoch>
X-CMAE-Envelope: MS4wfLd2UW8iXt/3L0sExGT42CiIWfoR5oYsk2UbxdrcSCcdvZIPysp5CMPuGKaBUXtgDfArSGX35y5TdaCFK6RoqdZFuRbtjYmPaMGwFmLnuFQnCmv1NiE0
 5zMUIRTL34XYveu7nefoT4qMbsT6YW56kA2e332E04/qFLb03In3OB6E
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 05, 2022 at 10:27:57PM +0100, Ladislav Michl wrote:
> I'm running current linux.git on custom Marvell OCTEON III CN7020
> based board. USB devices like FTDI (idVendor=0403, idProduct=6001,
> bcdDevice= 6.00) Realtek WiFi dongle (idVendor=0bda, idProduct=8179,
> bcdDevice= 0.00) works without issues, while Ralink WiFi dongle 
> (idVendor=148f, idProduct=5370, bcdDevice= 1.01) kills the host on
> disconnect:
> xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command
> xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assume dead
> xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
> 
> Unfortunately I do not have a datasheet for CN7020 SoC, so it is hard
> to tell if there is any errata :/ In case anyone see a clue in debug
> logs bellow, I'll happily give it a try.

So I do have datasheet now. As a wild guess I tried to use dlmc_ref_clk0
instead of dlmc_ref_clk1 as a refclk-type-ss and it fixed unplug death.
I have no clue why, but anyway - sorry for the noise :) Perhaps Octeon's
clock init is worth to be verified...

	ladis
