Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37D386D45E6
	for <lists+linux-usb@lfdr.de>; Mon,  3 Apr 2023 15:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbjDCNeX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Apr 2023 09:34:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232655AbjDCNeW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Apr 2023 09:34:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 488E283FC
        for <linux-usb@vger.kernel.org>; Mon,  3 Apr 2023 06:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680528812;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RK9gJXhsiFiEDpWFzlnAI9uAhso5eJOmjFfkF3fd4C8=;
        b=WJOigW0WlO2MVy5BKkukmQ6cwdPs3LWxlDUX2SUlvi0p7cj3K6isJSSVwJPO+WNIic0c6g
        mIhvaSRPk1d4H/EzWKyZUUzP0/4LrpV/DqwZSCQnSV1ToZiTEF03cKVW9NZmQjeTHwM+B2
        Jmpllrl8YzROIap9glTENndf0ZX6ycE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-WcRD3qRON12BX8jfo1wQXQ-1; Mon, 03 Apr 2023 09:33:29 -0400
X-MC-Unique: WcRD3qRON12BX8jfo1wQXQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE418858F09;
        Mon,  3 Apr 2023 13:33:28 +0000 (UTC)
Received: from plouf.local (unknown [10.45.224.142])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7CA2A175AD;
        Mon,  3 Apr 2023 13:33:27 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        Bastien Nocera <hadess@hadess.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
In-Reply-To: <20230302105555.51417-1-hadess@hadess.net>
References: <20230302105555.51417-1-hadess@hadess.net>
Subject: Re: [PATCH v3 1/6] HID: logitech-hidpp: Simplify array length
 check
Message-Id: <168052880728.319947.15479995000406070283.b4-ty@redhat.com>
Date:   Mon, 03 Apr 2023 15:33:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 02 Mar 2023 11:55:50 +0100, Bastien Nocera wrote:
> Use the compiler to force a 100-length array, rather than check the
> length after the fact.
> 
> 

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git (for-6.4/logitech-hidpp), thanks!

[1/6] HID: logitech-hidpp: Simplify array length check
      https://git.kernel.org/hid/hid/c/e0138763be2d
[2/6] HID: logitech-hidpp: Add support for ADC measurement feature
      https://git.kernel.org/hid/hid/c/c361982a13c9
[3/6] HID: logitech-hidpp: Add Logitech G935 headset
      https://git.kernel.org/hid/hid/c/4a1529f44e32
[4/6] USB: core: Add wireless_status sysfs attribute
      https://git.kernel.org/hid/hid/c/f98e0640c5c6
[5/6] USB: core: Add API to change the wireless_status
      https://git.kernel.org/hid/hid/c/0a4db185f078
[6/6] HID: logitech-hidpp: Set wireless_status for G935 receiver
      https://git.kernel.org/hid/hid/c/d9d5623f37c0

Cheers,
-- 
Benjamin Tissoires <benjamin.tissoires@redhat.com>

