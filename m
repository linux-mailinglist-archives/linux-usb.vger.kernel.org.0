Return-Path: <linux-usb+bounces-3731-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D07D804ECA
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 10:54:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A988D281760
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 09:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80044B5BB;
	Tue,  5 Dec 2023 09:54:37 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from msr17.hinet.net (msr17.hinet.net [IPv6:2001:b000:1c9:10:168:95:4:117])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FE789E;
	Tue,  5 Dec 2023 01:54:33 -0800 (PST)
Received: from initramfs.io (2001-b011-4002-3927-0000-0000-0000-000a.dynamic-ip6.hinet.net [IPv6:2001:b011:4002:3927:0:0:0:a])
	by msr17.hinet.net (8.15.2/8.15.2) with ESMTPS id 3B59sKIL003025
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 5 Dec 2023 17:54:20 +0800
Received: from howl.home.internal.initramfs.io ([10.0.96.176])
	by initramfs.io with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <initramfs@initramfs.io>)
	id 1rAS8C-0001QX-Gt; Tue, 05 Dec 2023 09:54:20 +0000
Message-ID: <d928d9ff-b9bd-4a82-9490-72cafdda37cd@initramfs.io>
Date: Tue, 5 Dec 2023 17:54:18 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ASMedia 2464PD-based SSD enclosure hotplug failure
To: Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux USB <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <2fd4b2b0-0526-4946-ad05-058366f3127a@initramfs.io>
 <ZUC3LAxK9Lyf2Rz9@debian.me>
 <44d23bf5-9875-4ce8-a361-fb4e678f23f2@initramfs.io>
 <c22ccb68-64b6-404b-a8a8-f800770e2cfb@gmail.com>
Content-Language: en-US
From: initramfs <initramfs@initramfs.io>
Autocrypt: addr=initramfs@initramfs.io; keydata=
 xjMEXU2jtxYJKwYBBAHaRw8BAQdA32TNgwBRB8zKTUDw+OD3EMHH6l7/9BctyPJZg7flyZrN
 JEFtaXQgQWduYW5pIDxpbml0cmFtZnNAaW5pdHJhbWZzLmlvPsKxBBMWCgBZAhsDBAsJCAcF
 FQoJCAsFFgIDAQACHgECF4ACGQEFCQomf3UWIQTmBUi9vIJeEJq2Q9jQE1WLzz4A7QUCXX/Y
 XBgYaGtwczovL2tleXMub3BlbnBncC5vcmcACgkQ0BNVi88+AO2eqgEAhxrvCxHqcWYCjEl3
 RtK1uMI5Vl78ADXimnIO3Zx2ZygBAK7SL/m0A87AZOj1x/xMjFqYOfSMfe6a8Up//XB0av8M
 zjgEXU2k1BIKKwYBBAGXVQEFAQEHQEnBKEjJUS59EzqqgBWZE3/2Q0BIXmGqreBXzeDMizs+
 AwEIB8J+BBgWCgAmAhsMFiEE5gVIvbyCXhCatkPY0BNVi88+AO0FAl/QqPQFCQomJKAACgkQ
 0BNVi88+AO2kRQEAiznrjgTNzeNfudqZz8MzyQqPEj3F0XeiloYOCbsrm8sA/jwF56ff7aRi
 HfhNFwJQJWzduZL3kmlkCrPxf9EGcvIP
In-Reply-To: <c22ccb68-64b6-404b-a8a8-f800770e2cfb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=DLJKXwBb c=1 sm=1 tr=0 ts=656ef34d
	a=IkcTkHD0fZMA:10 a=e2cXIFwxEfEA:10 a=4-Zg18BCeCbHWHEr31AA:9
	a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10

I can report this appears resolved on my system as of 6.7-rc3 and 6.6.4
most likely by commit 24d85bb3be373b5831699bddf698b392bd2b904d (though I
have not bisected to confirm).

Thanks.


