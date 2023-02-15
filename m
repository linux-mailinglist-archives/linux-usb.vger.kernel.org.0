Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE227697923
	for <lists+linux-usb@lfdr.de>; Wed, 15 Feb 2023 10:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbjBOJkZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Feb 2023 04:40:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233894AbjBOJkY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Feb 2023 04:40:24 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5526824C8E
        for <linux-usb@vger.kernel.org>; Wed, 15 Feb 2023 01:40:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8C1E861ADE
        for <linux-usb@vger.kernel.org>; Wed, 15 Feb 2023 09:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A2D2C433EF;
        Wed, 15 Feb 2023 09:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676454018;
        bh=FvrpUuX75njfyJuQMGXjnlItalnyuifrnS56l1AZXhU=;
        h=Date:To:Cc:From:Subject:From;
        b=SqWIdISYbyUnmWplf55/xUXpwBbf0unQUmzBECHg2n3RL0IiVAe58GJkoMwaNmCyX
         e380ZbLOZufN9VzGBZxEt0amplQ46P2iPqEnyWEDQYCvl/h+wg7BvuV+leJz5i2JYj
         ho86SuAt6/NaEr2I8B/ZEA6Wdn4ebyfY5AOAd+2/ldkrqezyewTWg0V4021gVF/nPs
         uu/p+VgbEWtuZ2PRNxOTj+fMJxDGBQ5Y8z2OVjQXKCCYAt+FIMyztYBGFaWy4VIzID
         TLoSAqy7bcxHR+844btr/Zdi6BVg2ptiz1kMA7AxYrWrv3447JnW3wn3yhfO/8F2Dt
         7Idm7tHaLA0lA==
Message-ID: <7e28eb10-f27b-682a-dfb3-fec3e70b01f6@kernel.org>
Date:   Wed, 15 Feb 2023 11:40:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From:   Roger Quadros <rogerq@kernel.org>
Subject: dwc3: gadget suspend/resume vs system suspend/resume
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Thinh,

Currently dwc3 gadget disconnects from the bus in the system suspend path. i.e. dwc3_gadget_suspend()->dwc3_disconnect_gadget().

Is it reasonable to expect dwc3 gadget to do a USB suspend instead of a USB disconnect during system suspend?
At USB resume, system can wake up and resume and then dwc3 gadget can resume.

I'd like to know your opinion please if this is a reasonable expectation or something just not possible to achieve. Thanks!

cheers,
-roger
