Return-Path: <linux-usb+bounces-34975-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNF4BQfFuWmcNQIAu9opvQ
	(envelope-from <linux-usb+bounces-34975-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 22:17:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D0A2B290C
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 22:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B442304D545
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 21:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C9C391822;
	Tue, 17 Mar 2026 21:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNiJcch+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eI80Xyfb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE82342CA7
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 21:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773782276; cv=none; b=Tr1Ghuwyt/HuzlB7cOOafXSIns7hpnQtll6+4gp7q4L705YVJGQipuyHg8oDx8Ep4WtpyRfq5LiuX2BMqYuerxxWoLxzzaVKieNjB9oW8I+pr67cqomvXqBHtrBMJdUYar31Rc8Rwzd3ygN8XhfCvniSBfVRczFr2WSZgqaeARc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773782276; c=relaxed/simple;
	bh=G5E8gMLHI0jXAIgdFPIt0X29EOUh8FSYC6STGx61EjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=haSxcifK+csNMARXrvvroaC49tWJGgfq0YkLLOJspspKk7AD5icw3ks9OqBjnfPpi1+0GJCkpFu1yOQNzlEoG0g+lUgo358ewW3r+Lwczn1m2op9Dy/q+1yoikrzbv2HSQ6v1r416mbGRU+SwHFllvtmU9FMNN/oa5R8GNulfXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cNiJcch+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eI80Xyfb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIJAoC3281280
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 21:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z/q9ATIVSVM4no+0kTRB9tPAmYoqjGUwM+IAHs7hi/4=; b=cNiJcch+zPsdab4z
	eOffazYrzU8osz5oImwF+Bz7avHqEY9AlQ1hB8sf7xLdI+B/0VEoB1I05ETln2in
	sqWfBRQShZKm/c2I7jcJRNhTH5sJb4NlfCwh5Yjt8SdLuF4xK631lDBcS8z1YBFN
	968t107oOq+VU+MhnHUWiSNU5WH5OgbZvocul7s0yyTuv8aW0fVuuFUp755QCnJz
	4KHZF540N+nKYNEAE8Ex03xmh7pBh7Fx9ZzzKJj0FShkJ/i7P5WJkLIR+gFlO6oe
	wJNyCbfRWM1Lx0prW2AB8znUpZY/rUoFgECmUFDiRMJjQJqHMTV+jZxqOZgDgaXh
	t6LLgQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya62s771-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 21:17:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c0bddb9196so1414802eec.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 14:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773782273; x=1774387073; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z/q9ATIVSVM4no+0kTRB9tPAmYoqjGUwM+IAHs7hi/4=;
        b=eI80XyfbbWrWPrDbtNV5Cg2CKy0djcfEanuwBS3JRjTz3sioBmmgMhlp8TIeku9eQC
         rON9sevHbWoi/Ps0eI/ki+XUMzjVSHvBltXN8fwzta0V/3GEsWwMExieowcfVVVktbHm
         CuQaTZsrKQhW6MlJAloisN9FHmWg4/sNPs9RoeXyrhhN4kKEDSKkVEJkCMhy5Bp57eC6
         OJYDRf4QyebiWFBUBHZMZtV338Ul851LbQzOjbmzA+A4AixCeU+HM1MWMzvQIIISmGr5
         nvVGtwWN7YZqDuAg7KIjNyca0D54vTqGC/AaxgbtS8MovchN5xbCY83EJRL9iJJwSg5P
         dj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773782273; x=1774387073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/q9ATIVSVM4no+0kTRB9tPAmYoqjGUwM+IAHs7hi/4=;
        b=ZSJxp7wENyan5zsKWNt2ThqiTDimxGYD3cJxoPGw59q50ZBVtcaSxyKkzxJ07Xld7W
         v0jO8BWhtmfL5mcnGxXXajIqKfivMrmzpC+h3SG/UBLvhG/5HrvgcMrAdtmUUekTF1uy
         hySOREcy6hyB9WhLW6XWHKDaQv88eMOrTxW8332JgR99BVXKa9+688DitAOH7yyHHxsJ
         Iu0XYGu2EI7+t2LaFWuLGjbZDJMbnDiXq6KZzWRm/3Pfw0Swlj7h239RdELobjT5wxTi
         mX25zEGEkMZmoe4pxGUuhsM+iUd4CkDY1vnaTxwn/vQ2GrrVqqfBSgx0Nfp/MpwRTntN
         xNEA==
X-Gm-Message-State: AOJu0Yz95hfANVLhbDCk+Joa6xWyiUheDLYQf9HHSZF4SsrWMNs+XbnD
	fx9a2/tk4xGuP9r/g9mVnuUYhY/1cEvNBQ9WaIogxg5wDaNauRZ7/XJOJK+7AaNyH1n6HIij8rI
	oID1XbePY8mD9QdCjOsZLUszArJ+YiCf4gCgGS+HKJmG9580VnlRr99g+AqCWBls=
X-Gm-Gg: ATEYQzwQc8D98FizzTXVM+r3Iud9ecduPr64/93vXuU9lbt6rzSxTENONJhszoLIy8c
	eGqzucVkD57KErsu2Dr7xakzyzhekFhrL7jeVEYF40X4ktF36M4e6oJIrx8jfjVSJCSu7xnMS4J
	hHsBY/WZ2jPpE8eWu/rz4uSxowgP0HRlG8QcQZbt384TmxRydyfRUe/uu0sus3cXfFwUNf/ZBxD
	AM3jaDkUx/IkcKM76wJsXPzWFJer6HqqAN7tr5CxhbCMUn0OlL2SrvWqa/pzUtV6qnwb1895iHr
	Zh34haMq3E11IKreMm73C5GVXUYi4LDI3JE2fnrkllZsXU+p0OkdKwqJ3+TjjSZmEdXy2NL0Bu0
	/aXwCi64bad7Kg+nurT43Z/p71hhW3yi5GqFuQ9Mk3I4Y3keOAgl7rBkho1Y3gt96uWjc
X-Received: by 2002:a05:7301:3d12:b0:2c0:af67:e908 with SMTP id 5a478bee46e88-2c0e4fb8276mr476653eec.11.1773782272888;
        Tue, 17 Mar 2026 14:17:52 -0700 (PDT)
X-Received: by 2002:a05:7301:3d12:b0:2c0:af67:e908 with SMTP id 5a478bee46e88-2c0e4fb8276mr476635eec.11.1773782272260;
        Tue, 17 Mar 2026 14:17:52 -0700 (PDT)
Received: from [10.73.193.53] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e55834a0sm969550eec.14.2026.03.17.14.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 14:17:51 -0700 (PDT)
Message-ID: <505ab422-f933-4674-8f93-8744d0e67c6d@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 14:17:51 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] usb: offload: move device locking to callers in
 offload.c
To: Guan-Yu Lin <guanyulin@google.com>, gregkh@linuxfoundation.org,
        mathias.nyman@intel.com, perex@perex.cz, tiwai@suse.com,
        quic_wcheng@quicinc.com, broonie@kernel.org, arnd@arndb.de,
        christophe.jaillet@wanadoo.fr, xiaopei01@kylinos.cn
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, stable@vger.kernel.org,
        Hailong Liu <hailong.liu@oppo.com>
References: <20260309022205.28136-1-guanyulin@google.com>
 <20260309022205.28136-2-guanyulin@google.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <20260309022205.28136-2-guanyulin@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ns3cssdJ c=1 sm=1 tr=0 ts=69b9c501 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=A2pY-5KRAAAA:8 a=NM9l3GWZ3kzQVf3-aygA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: mA507OW08yXWjqbIijm9hmJMvGrxxmF3
X-Proofpoint-GUID: mA507OW08yXWjqbIijm9hmJMvGrxxmF3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE4NyBTYWx0ZWRfX2TXoD9ZtlmfP
 NCXTL7IaVsnr2BjaFzrQULKT8uGTn8J9KsXXRkKU4jTJzo8z0HIxsD+s3X9+w225wgjxCrA8Vst
 1uxcGF+ZCyU2jTuixCem3VkvM2AhP+keUJ7vJQXfjkNmNYcAKnJmCBxVC/VR183T6CkDAKLBGjc
 X9dfB06EA57nznFJQXIMdVhbs76kWXPxxXaP0Ud/JQJeqbklwML+1WxL1D7gzTfaO3SJ1Dl5R2R
 FjTFXpfzyYlP0b581tbyEi8y3z6Xe2Rv7KDJFPbufBSbdZd/43ymoxGLVlfe7P/6ADcatUywLw3
 wn7ormqZvHfu9UI7oJ7qg8JSA8HaU1pmdRCtxSG1Jeyi05KLPToWJHEQmAehz2GcIqmNbQwQby8
 04AamB12o3BSgsZRW28mcbKZ2nK+1AHu7mcR1h37PymR/PbYN5WB2D+D+kZfWdUP2pO9q8zy42O
 3SJNAUqtLaaPuiauH9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170187
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34975-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[google.com,linuxfoundation.org,intel.com,perex.cz,suse.com,quicinc.com,kernel.org,arndb.de,wanadoo.fr,kylinos.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wesley.cheng@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A8D0A2B290C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/8/2026 7:22 PM, Guan-Yu Lin wrote:
> Update usb_offload_get() and usb_offload_put() to require that the
> caller holds the USB device lock. Remove the internal call to
> usb_lock_device() and add device_lock_assert() to ensure synchronization
> is handled by the caller. These functions continue to manage the
> device's power state via autoresume/autosuspend and update the
> offload_usage counter.
> 
> Additionally, decouple the xHCI sideband interrupter lifecycle from the
> offload usage counter by removing the calls to usb_offload_get() and
> usb_offload_put() from the interrupter creation and removal paths. This
> allows interrupters to be managed independently of the device's offload
> activity status.
> 
> Cc: stable@vger.kernel.org
> Fixes: ef82a4803aab ("xhci: sideband: add api to trace sideband usage")
> Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
> Tested-by: Hailong Liu <hailong.liu@oppo.com>
> ---
>   drivers/usb/core/offload.c       | 34 +++++++++++---------------------
>   drivers/usb/host/xhci-sideband.c | 14 +------------
>   2 files changed, 13 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/usb/core/offload.c b/drivers/usb/core/offload.c
> index 7c699f1b8d2b..e13a4c21d61b 100644
> --- a/drivers/usb/core/offload.c
> +++ b/drivers/usb/core/offload.c
> @@ -20,6 +20,7 @@
>    * enabled on this usb_device; that is, another entity is actively handling USB
>    * transfers. This information allows the USB driver to adjust its power
>    * management policy based on offload activity.
> + * The caller must hold @udev's device lock.
>    *
>    * Return: 0 on success. A negative error code otherwise.
>    */
> @@ -27,31 +28,25 @@ int usb_offload_get(struct usb_device *udev)
>   {
>   	int ret;
>   
> -	usb_lock_device(udev);
> -	if (udev->state == USB_STATE_NOTATTACHED) {
> -		usb_unlock_device(udev);
> +	device_lock_assert(&udev->dev);
> +
> +	if (udev->state == USB_STATE_NOTATTACHED)
>   		return -ENODEV;
> -	}
>   
>   	if (udev->state == USB_STATE_SUSPENDED ||
> -		   udev->offload_at_suspend) {
> -		usb_unlock_device(udev);
> +	    udev->offload_at_suspend)
>   		return -EBUSY;
> -	}
>   

Do we really need to be explicitly checking for the usb device state before 
we touch the offload_usage count?  In the end, its a reference count that 
determines how many consumers are active for a specific interrupter, so my 
question revolves around if we need to have such strict checks.

>   	/*
>   	 * offload_usage could only be modified when the device is active, since
>   	 * it will alter the suspend flow of the device.
>   	 */
>   	ret = usb_autoresume_device(udev);
> -	if (ret < 0) {
> -		usb_unlock_device(udev);
> +	if (ret < 0)
>   		return ret;
> -	}
>   

IMO this should be handled already by the class driver, and if not, what is 
the harm?

>   	udev->offload_usage++;
>   	usb_autosuspend_device(udev);
> -	usb_unlock_device(udev);
>   
>   	return ret;
>   }
> @@ -64,6 +59,7 @@ EXPORT_SYMBOL_GPL(usb_offload_get);
>    * The inverse operation of usb_offload_get, which drops the offload_usage of
>    * a USB device. This information allows the USB driver to adjust its power
>    * management policy based on offload activity.
> + * The caller must hold @udev's device lock.
>    *
>    * Return: 0 on success. A negative error code otherwise.
>    */
> @@ -71,33 +67,27 @@ int usb_offload_put(struct usb_device *udev)
>   {
>   	int ret;
>   
> -	usb_lock_device(udev);
> -	if (udev->state == USB_STATE_NOTATTACHED) {
> -		usb_unlock_device(udev);
> +	device_lock_assert(&udev->dev);
> +
> +	if (udev->state == USB_STATE_NOTATTACHED)
>   		return -ENODEV;
> -	}
>   
>   	if (udev->state == USB_STATE_SUSPENDED ||
> -		   udev->offload_at_suspend) {
> -		usb_unlock_device(udev);
> +	    udev->offload_at_suspend)
>   		return -EBUSY;
> -	}
>   

During your testing, did you ever run into any unbalanced counter issues 
due to the above early exit conditions?

I guess these are all just questions to see if we can remove the need to 
lock the udev mutex, and move to a local mutex for the offload framework. 
That would address the locking concerns being brought up by Greg, etc...

Thanks
Wesley Cheng

>   	/*
>   	 * offload_usage could only be modified when the device is active, since
>   	 * it will alter the suspend flow of the device.
>   	 */
>   	ret = usb_autoresume_device(udev);
> -	if (ret < 0) {
> -		usb_unlock_device(udev);
> +	if (ret < 0)
>   		return ret;
> -	}
>   
>   	/* Drop the count when it wasn't 0, ignore the operation otherwise. */
>   	if (udev->offload_usage)
>   		udev->offload_usage--;
>   	usb_autosuspend_device(udev);
> -	usb_unlock_device(udev);
>   
>   	return ret;
>   }
> diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
> index 2bd77255032b..6fc0ad658d66 100644
> --- a/drivers/usb/host/xhci-sideband.c
> +++ b/drivers/usb/host/xhci-sideband.c
> @@ -93,8 +93,6 @@ __xhci_sideband_remove_endpoint(struct xhci_sideband *sb, struct xhci_virt_ep *e
>   static void
>   __xhci_sideband_remove_interrupter(struct xhci_sideband *sb)
>   {
> -	struct usb_device *udev;
> -
>   	lockdep_assert_held(&sb->mutex);
>   
>   	if (!sb->ir)
> @@ -102,10 +100,6 @@ __xhci_sideband_remove_interrupter(struct xhci_sideband *sb)
>   
>   	xhci_remove_secondary_interrupter(xhci_to_hcd(sb->xhci), sb->ir);
>   	sb->ir = NULL;
> -	udev = sb->vdev->udev;
> -
> -	if (udev->state != USB_STATE_NOTATTACHED)
> -		usb_offload_put(udev);
>   }
>   
>   /* sideband api functions */
> @@ -328,9 +322,6 @@ int
>   xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
>   				 bool ip_autoclear, u32 imod_interval, int intr_num)
>   {
> -	int ret = 0;
> -	struct usb_device *udev;
> -
>   	if (!sb || !sb->xhci)
>   		return -ENODEV;
>   
> @@ -348,12 +339,9 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
>   	if (!sb->ir)
>   		return -ENOMEM;
>   
> -	udev = sb->vdev->udev;
> -	ret = usb_offload_get(udev);
> -
>   	sb->ir->ip_autoclear = ip_autoclear;
>   
> -	return ret;
> +	return 0;
>   }
>   EXPORT_SYMBOL_GPL(xhci_sideband_create_interrupter);
>   


