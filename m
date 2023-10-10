Return-Path: <linux-usb+bounces-1375-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B260C7BFFE7
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 17:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D55121C20DA2
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 15:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A408E28F4;
	Tue, 10 Oct 2023 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sensoray.com header.i=@sensoray.com header.b="htj6qxqK"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8E929412
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 15:02:26 +0000 (UTC)
Received: from omta039.useast.a.cloudfilter.net (omta039.useast.a.cloudfilter.net [44.202.169.38])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCCCCAC
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 08:02:24 -0700 (PDT)
Received: from eig-obgw-5010a.ext.cloudfilter.net ([10.0.29.199])
	by cmsmtp with ESMTP
	id pzWcqU8GaaLCxqEFbqDxzn; Tue, 10 Oct 2023 15:02:23 +0000
Received: from gator3086.hostgator.com ([50.87.144.121])
	by cmsmtp with ESMTPS
	id qEFbqMgbzX2l7qEFbqNK4w; Tue, 10 Oct 2023 15:02:23 +0000
X-Authority-Analysis: v=2.4 cv=Ut5wis8B c=1 sm=1 tr=0 ts=6525677f
 a=qMXOcmIMY6YlrKEg1GzxDg==:117 a=QsTHvn2EeHXCImuSLmd++Q==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=kj9zAlcOel0A:10 a=bhdUkHdE2iEA:10 a=6kiSLZGAxYIA:10 a=wXneSEFuAAAA:8
 a=Z4Rwk6OoAAAA:8 a=zlXjzUhwOT6McCRvPVsA:9 a=CjuIK1q_8ugA:10
 a=YVKGGmaMxpnpCiYzuRtG:22 a=HkZW87K1Qel5hWWM3VKY:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sensoray.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QMQ0DdGQWx0t9SfeWzFXKxFzsTczkhDHsDEr+dfX7jw=; b=htj6qxqK94dgCRrSYYZZRpQEtb
	WrVAiOch1GbcHdF62a/hJl0drShVBPdgky7onBYvdswud1eoEWmFsjxq0Q22h573YQww53ss8BrWn
	r08LovciFepDsh6wmGCqsMNpagH1TWznM3PkahYXD4Rm8+MVFkcF56e74ne2T2EdjD/E=;
Received: from gator3086.hostgator.com ([50.87.144.121]:12142)
	by gator3086.hostgator.com with esmtpa (Exim 4.95)
	(envelope-from <dean@sensoray.com>)
	id 1qqEFa-001qqY-HP;
	Tue, 10 Oct 2023 10:02:22 -0500
Received: from mail.thomaswright.com ([50.126.89.90])
 by www.sensoray.com
 with HTTP (HTTP/1.1 POST); Tue, 10 Oct 2023 10:02:22 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 10 Oct 2023 10:02:22 -0500
From: dean@sensoray.com
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-dev@sensoray.com, balbi@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: function fs req_match endpoint address fix
In-Reply-To: <2023101025-tavern-properly-3114@gregkh>
References: <20231009220656.2990612-1-linux-dev@sensoray.com>
 <2023101025-tavern-properly-3114@gregkh>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <17afa339f888408c3d49e5b4adb19c06@sensoray.com>
X-Sender: dean@sensoray.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator3086.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sensoray.com
X-BWhitelist: no
X-Source-IP: 50.87.144.121
X-Source-L: Yes
X-Exim-ID: 1qqEFa-001qqY-HP
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: gator3086.hostgator.com [50.87.144.121]:12142
X-Source-Auth: dean@sensoray.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: c2Vuc29yYXk7c2Vuc29yYXk7Z2F0b3IzMDg2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfN3r4JTKxPLe5Pg7jmuhNgo49+ACh5UnrFsYEQws4iNJ5Mg/dIRKSRWxkGKug/HzfuXsKWN1sG6Tcdq94cga2OAey2BtdWc/tZ2HM5SOcGZ2riG8mLjI
 S4MBJlu0Qrf6x4QEsYGjH4MhEIeqYYuQYAdJg9DgxCQ+NSKEepXONYS/B2PXrUgG8sIgi9EEwfFwDnXoXFZ8wug8VT/Kqea8fhU=
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,TRACKER_ID,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 2023-10-10 01:00, Greg KH wrote:
> On Mon, Oct 09, 2023 at 03:06:56PM -0700, linux-dev@sensoray.com wrote:
>> From: Dean Anderson <linux-dev@sensoray.com>
>> 
>> Fixes f_fs.c handling USB_RECIP_ENDPOINT request types incorrectly for
>> endpoints not belonging to it. f_fs.c needs to distinguish between IN
>> and OUT endpoints, not just the endpoint number. Otherwise, f_fs may
>> handle endpoints belonging to other functions. This occurs in the
>> gadget/composite.c composite_setup function in the req_match callback.
>> 
>> Signed-off-by: Dean Anderson <linux-dev@sensoray.com>
>> 
>> ---
>>  drivers/usb/gadget/function/f_fs.c | 14 ++++++++++----
>>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> What commit id does this fix?

8a749fd1a8720d4619c91c8b6e7528c0a355c0aa

"git log"

commit df91c8a9c05098f06ad2dd5bf0d9342e80a9eb22 (HEAD -> v6.6-rc4)
Author: Dean A <dean@sensoray.com>
Date:   Mon Oct 9 15:04:19 2023 -0700

     usb: gadget: function fs req_match endpoint address fix

commit 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa (tag: v6.6-rc4)
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Oct 1 14:15:13 2023 -0700

     Linux 6.6-rc4


