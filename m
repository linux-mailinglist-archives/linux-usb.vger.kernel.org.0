Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42C3E48D4B9
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jan 2022 10:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbiAMJHH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jan 2022 04:07:07 -0500
Received: from asav22.altibox.net ([109.247.116.9]:51316 "EHLO
        asav22.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232009AbiAMJHG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jan 2022 04:07:06 -0500
X-Greylist: delayed 516 seconds by postgrey-1.27 at vger.kernel.org; Thu, 13 Jan 2022 04:07:06 EST
Received: from canardo.mork.no (207.51-175-193.customer.lyse.net [51.175.193.207])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bmork@altiboxmail.no)
        by asav22.altibox.net (Postfix) with ESMTPSA id 5391021BA9;
        Thu, 13 Jan 2022 09:58:30 +0100 (CET)
Received: from miraculix.mork.no ([IPv6:2a01:799:c9f:8602:8cd5:a7b0:d07:d516])
        (authenticated bits=0)
        by canardo.mork.no (8.15.2/8.15.2) with ESMTPSA id 20D8wTjB374244
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Thu, 13 Jan 2022 09:58:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1642064310; bh=yl54sanNDUWMM+AQIqqbrLuI+gS3uSjsOTBkYc4iasQ=;
        h=From:To:Cc:Subject:References:Date:Message-ID:From;
        b=Ow0snsYg7v9svbkLjut8FAcTL7sH0CoLiBwOXe17Xma0wVfcv/Tug/PrRzZcKB+l0
         FuNRJ+ri/SSGe60HG/qJ6mW3etsfXvjJ/zk5mvrxdvtcMROljDtYGcXpLUighyJeaW
         iEkSOSm6r/GMQz2Q+5SCOw37xaX8rEWcTcAUiw1s=
Received: from bjorn by miraculix.mork.no with local (Exim 4.94.2)
        (envelope-from <bjorn@mork.no>)
        id 1n7vwD-001bMx-LU; Thu, 13 Jan 2022 09:58:29 +0100
From:   =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To:     Kyoungkyu Park <choryu.park@choryu.space>
Cc:     davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] net: qmi_wwan: Add Hucom Wireless HM-211S/K
Organization: m
References: <Yd+nxAA6KorDpQFv@choryu-tfx5470h>
Date:   Thu, 13 Jan 2022 09:58:29 +0100
In-Reply-To: <Yd+nxAA6KorDpQFv@choryu-tfx5470h> (Kyoungkyu Park's message of
        "Thu, 13 Jan 2022 13:17:08 +0900")
Message-ID: <87wnj4vwp6.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.103.3 at canardo
X-Virus-Status: Clean
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f6Fm+t6M c=1 sm=1 tr=0
        a=XJwvrae2Z7BQDql8RrqA4w==:117 a=XJwvrae2Z7BQDql8RrqA4w==:17
        a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DghFqjY3_ZEA:10 a=M51BFTxLslgA:10
        a=rWqaOqVXLpn30FgQbZwA:9 a=QEXdDO2ut3YA:10 a=3la3ztWH3XQaG4dFsChN:22
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Acked-by: Bj=C3=B8rn Mork <bjorn@mork.no>
