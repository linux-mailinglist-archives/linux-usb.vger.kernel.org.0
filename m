Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC9D307E00
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jan 2021 19:32:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbhA1SaF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 13:30:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231929AbhA1S2V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jan 2021 13:28:21 -0500
Received: from mout1.freenet.de (mout1.freenet.de [IPv6:2001:748:100:40::2:3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97A8FC061786
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 10:27:25 -0800 (PST)
Received: from [195.4.92.121] (helo=sub2.freenet.de)
        by mout1.freenet.de with esmtpa (ID andihartmann@freenet.de) (port 25) (Exim 4.92 #3)
        id 1l5C0n-0001YR-PY; Thu, 28 Jan 2021 19:27:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=01019freenet.de; s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=sThhcVBOnii7Z6VExoD8zAUo4jrLfgi2M1u1jTnh6KQ=; b=wbC7SJE4I1mQTuXHWotGqVNmfF
        iuuMaCPy0RH7yA+m1n3ynOEb9EB2HlvpEvfJYwycU9VkW8iEbxFVdODNeXsYklwKHd0s1cGZos+ny
        TicZLjYB2Akz4BKV0GcYIFD2zLHukV7lkQ7YewdMa3uI4LKK6DCUHWHcsvRJJWWmMXDVsE8hN+Pcu
        zkcIK8DbmiWsqMqpmg0vJq/t0wfejpRcKJyvaObwojkRwIXXfK8uTIgxo7z/b3qb3eD5K/bZnyCLL
        ni0bDdNNZCqOj6ZB75uqygBgYrV1n+cGtHTqCbotNMa3fR3FvAsJX/oXMAvp40tzGh2zJ1g3fi8lE
        1HVyfpqA==;
Received: from p200300de573c8400505400fffe15ac42.dip0.t-ipconnect.de ([2003:de:573c:8400:5054:ff:fe15:ac42]:53376 helo=mail.maya.org)
        by sub2.freenet.de with esmtpsa (ID andihartmann@freenet.de) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (port 465) (Exim 4.92 #3)
        id 1l5C0n-0001dd-N6; Thu, 28 Jan 2021 19:27:21 +0100
Received: internal info suppressed
Subject: Re: USB2 / USB3 compatibility problems: xhci_hcd 0000:00:06.0: WARN
 Wrong bounce buffer write length: 0 != 512
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        linux-usb@vger.kernel.org
References: <3b4e35d2-9508-e0aa-eaf8-32e524ad81c4@01019freenet.de>
 <756e7b88-1142-4758-b8f7-a8eaf510b422@01019freenet.de>
 <edc3c7b1-98fa-9062-5c17-426e8ad17370@01019freenet.de>
 <7e953b15-925a-1512-4d15-c07fc03f9059@01019freenet.de>
 <f83677b5-e3d1-afdb-c8d4-f9969fa3fe84@linux.intel.com>
 <a65a9299-1e5b-f15d-2ae7-f0a21938f4fd@01019freenet.de>
 <d9fd7812-43cc-2813-5222-5e39b63fccbc@01019freenet.de>
 <8de6ecb9-4a39-5742-a358-d6965feffc79@linux.intel.com>
 <021e1727-0e2e-0207-ace2-4382489eea1f@linux.intel.com>
 <de0cab7e-6e25-fe80-b1d7-d50f63d6e54c@01019freenet.de>
 <9c3c9dd7-bcfb-785c-8c11-39f78a7fca01@01019freenet.de>
 <ab675d28-d80f-ed72-5db0-943cb26819f1@linux.intel.com>
From:   Andreas Hartmann <andihartmann@01019freenet.de>
Message-ID: <bb597700-4320-f57c-c1cf-4eb2d428492a@01019freenet.de>
Date:   Thu, 28 Jan 2021 19:27:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <ab675d28-d80f-ed72-5db0-943cb26819f1@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originated-At: 2003:de:573c:8400:5054:ff:fe15:ac42!53376
X-FNSign: v=2 s=46C948E5222D9BC73950518F5785765F30614101C79C54E2D4635EA09874419A
X-Scan-TS: Thu, 28 Jan 2021 19:27:21 +0100
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Mathias,

out of curiosity: could the same happen, too, on the receive side? I can
see a similar check in static void xhci_unmap_td_bounce_buffer.
rt5572sta e.g. uses for receiving urb->transfer_buffer, too. I can see
no problems at all for this path at the moment (not even a warning) -
but couldn't this just be chance?


Thanks
Michael
