Return-Path: <linux-usb+bounces-4496-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A342C81B95C
	for <lists+linux-usb@lfdr.de>; Thu, 21 Dec 2023 15:15:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C22D41C24353
	for <lists+linux-usb@lfdr.de>; Thu, 21 Dec 2023 14:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B766D6D7;
	Thu, 21 Dec 2023 14:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BI6yDXxT"
X-Original-To: linux-usb@vger.kernel.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.199])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B08536086
	for <linux-usb@vger.kernel.org>; Thu, 21 Dec 2023 14:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=+0FyMGtCJdGqrK4uI+ZoZroijIB3+Xqkvms47mrrBB0=;
	b=BI6yDXxT060iDYbcUIP00HQlJFuGwpbPV8mAFKrW6v4eDDRjffTxlzDQDAa2+S
	vK8Ha+rNlF+xIfvfXCJS5TTil6RN/l2uNmf85JGfeC0sl7dO95KNUP8LPcn7cc3N
	C7LZfRlygtiuTKrFrYZep35LdSPMn7h7q/lsysvq+/nTQ=
Received: from [192.168.71.6] (unknown [114.92.108.205])
	by zwqz-smtp-mta-g3-4 (Coremail) with SMTP id _____wD3v7NUSIRlj5J9AQ--.53644S2;
	Thu, 21 Dec 2023 22:14:49 +0800 (CST)
Message-ID: <74e0092a-f084-4e87-8d83-df27fb5a0290@163.com>
Date: Thu, 21 Dec 2023 22:14:16 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] usb: gadget: f_uvc: change endpoint allocation in
 uvc_function_bind()
To: Frank Li <Frank.li@nxp.com>
Cc: linux-usb@vger.kernel.org
References: <20230803091053.9714-1-quic_linyyuan@quicinc.com>
 <20230803091053.9714-4-quic_linyyuan@quicinc.com>
 <ZYHCESCO4EXPQbFY@lizhi-Precision-Tower-5810>
 <b793b44e-ce40-4f03-808a-8606970cb2e6@163.com>
 <ZYMQDVU+c+gEQjE9@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: yuan linyu <cugyly@163.com>
In-Reply-To: <ZYMQDVU+c+gEQjE9@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v7NUSIRlj5J9AQ--.53644S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw1fAw4UXw47JF15uFWfZrb_yoW8ury8pw
	4xuw4rAr10qa4rKw1kA3WkZFyrJw4rZrWDGrnYkas8Aw43ZFya9FyUKa1FyFykJr47Zw40
	yFW5J3WI9rykAaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UkDGrUUUUU=
X-CM-SenderInfo: pfxj5zr16rljoofrz/1tbiERtN417++MNPngAAsu


On 2023/12/21 00:02, Frank Li wrote:
>>> Some UDC driver use gadget_check_config() and match_ep() to allocate EP
>>> internal fifo memory resource, if only pass download full speed EP.
>> Could you share  the detail of problem ? do you mean find another different endpoint compared
> The problem is little bit complex. I try to use simple words.
>
> The background:
>
> Generally, UDC have some EP<0..15> and have some internal memory as FIFO.
> for example 16K.  You can simple assign EP<n> to 1K memory, which can hold
> whole package.
>
> But for UVC, some controller required internal FIFO hold whole frame data
>
> (mult+1) * (MaxBurst +1) * wPackageSize.
>
> For most case,  not every gadget use all 16 EPs. So you can assgin more
> memory into one EP, so it will reduce bus 'ping' package number and reduce
> NACK to improve transfer speed.
>
> The problem:
> pass fs_stream to udc driver, udc driver's check_config function will see
> mult and maxburst is 0. so only reserve 1K for ISO EP, but when try to 
> enable EP,  mult is 2, so there are not enough internal memory for it
> because more memory already assign to other EPs.
>
> Ideally, when gadget frame work can call check_config again when know
> usb speed, but it is not easy to fix it.
>
> Simple method use ss_stream_ep here and other function drviers. Super
> speed's package size is bigger than high/full speed. If resource can
> support super speed, it can support high/full speed.


I don't find any difference of uvc_ss_streaming_ep, uvc_hs_streaming_ep, uvc_fs_streaming_ep

descriptors. how difference happen in UDC ?


>
>
> /**
>  * gadget_is_superspeed() - return true if the hardware handles superspeed
>  * @g: controller that might support superspeed
>  */
>
> @max_speed: Highest speed the driver handles
>
> And according to gadget_is_superspeed() define, it indicate if udc
> controller support supersped, not link speed. 
>
> Orignial code is correct. If UDC support superspeed, then use ss_stream_ep.
>
> becasue superspeed is worse case compared as high and full speed.
>
> So I think original is correct.
>
> Frank.
>
>


