Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4820307CB3
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jan 2021 18:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233232AbhA1RhV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 12:37:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233178AbhA1RhQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jan 2021 12:37:16 -0500
Received: from mout0.freenet.de (mout0.freenet.de [IPv6:2001:748:100:40::2:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B17EC061573
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 09:36:20 -0800 (PST)
Received: from [195.4.92.125] (helo=sub6.freenet.de)
        by mout0.freenet.de with esmtpa (ID andihartmann@freenet.de) (port 25) (Exim 4.92 #3)
        id 1l5BDO-0003Im-Et; Thu, 28 Jan 2021 18:36:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=01019freenet.de; s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=p5MvETlHRYRrVpSLYKJJH7EA9ym+lMcWG97Ezj2QDoI=; b=p+mexFkI2lVbE7Q48KDPeoBIL0
        emMBLUeK/lCafkF/W30DrzkE1PswzROEHZ5Px+SUdgkAGF7RGgWV7xiqfQSySQsBk6CSUhL1T7FKu
        G0xbWhxCjE3hMCuqqsK3vQgj4qd+SOArAe1ZKXuPOEG5Z4W7/ntwqV/IXfoeIZvLwwNTLsY7Et/Xf
        PxaF7WKUkCy0RTv93DtlVUdA/emikc/vIU+sc4ktdo1aSnyYj8YqPYy2TqDiSKG++DScTApbMuaC4
        3wbFIsd5HBiVRXE72ceU65HXWuzoEsWH57CvWk7OqNQYDWrSvrRftGsX1qHqKInkw7cWIXbJBkRII
        nf0SklGQ==;
Received: from p200300de573c8400505400fffe15ac42.dip0.t-ipconnect.de ([2003:de:573c:8400:5054:ff:fe15:ac42]:51890 helo=mail.maya.org)
        by sub6.freenet.de with esmtpsa (ID andihartmann@freenet.de) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (port 465) (Exim 4.92 #3)
        id 1l5BDO-0001Ry-Cy; Thu, 28 Jan 2021 18:36:18 +0100
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
Message-ID: <c7c45204-c63e-01c3-4879-7495cbdd1788@01019freenet.de>
Date:   Thu, 28 Jan 2021 18:36:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <ab675d28-d80f-ed72-5db0-943cb26819f1@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originated-At: 2003:de:573c:8400:5054:ff:fe15:ac42!51890
X-FNSign: v=2 s=B19339E32DFCB8DFCDF5DD52A599210473FB11EC0F4CAE25614F701E14B7B77C
X-Scan-TS: Thu, 28 Jan 2021 18:36:18 +0100
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Mathias,

On 28.01.21 at 15:14 Mathias Nyman wrote:
> 
> I think I'll submit this patch as it is (with a proper commit message)
> can I add reported-by: Andreas Hartmann <andihartmann@01019freenet.de>, and
> tested-by: Andreas Hartmann <andihartmann@01019freenet.de> tags to the patch?

I forgot:
Would it be possible to add the warning about wrong bounce buffer write
length to the transfer_buffer-case, too?


Thanks
Andreas
