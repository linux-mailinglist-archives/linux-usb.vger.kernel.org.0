Return-Path: <linux-usb+bounces-31426-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 192D5CBA38D
	for <lists+linux-usb@lfdr.de>; Sat, 13 Dec 2025 03:58:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 114E930071B6
	for <lists+linux-usb@lfdr.de>; Sat, 13 Dec 2025 02:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB822F068A;
	Sat, 13 Dec 2025 02:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h0kD/Gaq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UU4xvHLx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCBD238C03
	for <linux-usb@vger.kernel.org>; Sat, 13 Dec 2025 02:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765594697; cv=none; b=i6v1Aqhqj0Vya9KXiuUapjsTsOi04n95pvn3s5lvmpctJsr9qQyn1oIZ1ryF83Q9k5P+Wnkm0TibtyOc8k5BbKGIHGB43JoaFK1+5Qaakcx1BOb9mJm6/VQt3lyX6KejNy7VkG/TJXqZh9viaKzygukb5jJb9wrRcVLtGkJY88Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765594697; c=relaxed/simple;
	bh=TQ3ZcV43KyGFIHSGSS0yNEgMeFeLR/+D1FD2TVxQdOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9gVL13aS1nHI4UzKH1uuAjc0gKWUqsiDpxESVQHJTpEFGv2vDjh4pBtd6IWu1UnOBZUmQwxRyAuAAtZm6bfXQKAjqBtO0Hw4AULRm0pIaS/rZ6gHDqt7YDlgzLmR8/ldNxm3TZJQR0i4T+FMeUUMqMiDXS3zkepAApLNy6MU6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h0kD/Gaq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UU4xvHLx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BD2plpg2562066
	for <linux-usb@vger.kernel.org>; Sat, 13 Dec 2025 02:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lyDdQlY3CDNLonosH+aQdEh4
	ZBNcDALqwuYHv3Ore1E=; b=h0kD/GaqDooCWkEgUgofVBuzusq1lJz7bzmTPMA7
	yxo0O3uOoIKx+akFc28K8eYS0myvY8CeBpJCkQRUoZMceUd7khKAXR4xoFbv+u2b
	PfDj4vee4+eRLkNGaEu7dQeqLC92jP52zYSZjs3E4Ub6CXZtfqxCYMbAzs4ADH/N
	hNIHcd0XT+npHMGBrZY9ANqfLQeCLWwHxLW41f0tW4NfsY096KH6g8Xhl4B+VS8v
	KEAFA22vaAu1r7AZR5puPzLCgrZgJ8Iyw7cjFuA+jO6SEp2Og/9EtkdKsz7FpfTN
	+We0mSsk/0hM9TJW3JHoRzb9WalSH7S4kDwDQtTn9zdQPg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b0yqxg07v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 13 Dec 2025 02:58:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2e235d4d2so634244985a.3
        for <linux-usb@vger.kernel.org>; Fri, 12 Dec 2025 18:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765594692; x=1766199492; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lyDdQlY3CDNLonosH+aQdEh4ZBNcDALqwuYHv3Ore1E=;
        b=UU4xvHLxmDgssmKN0/8pMxmnrUlRiQ2vvAAySIybubY7DUxigITduYYG1ttk9Hlrum
         DXv7Fu8Aki2KKwZKQySUhK3DVjztpMvPWWYwjMdJpWhZXLAlG7DQrEzcJvV8PY29o3Ik
         fSEqFtkjbBKeSIySe0jx3N6xEunIk87Kznf9Cdaw5IYxPS60r+qmJe6X1PAFqlReZKTx
         DA8s4MUxmbUXLnXswc8nYauKIC10kxZHuoAOHaPUOBzhaQbDbQd0FAOqYYyyJpwz5mES
         JMtQPj0o9m3NRJbIqriTyEyA3Sc8j+18W89SnVTuQKEzcXoAZ+ia3XzdQRyTeZ3Q9shc
         XNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765594692; x=1766199492;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyDdQlY3CDNLonosH+aQdEh4ZBNcDALqwuYHv3Ore1E=;
        b=P+813ESQdWcLoDhHBpfABLI/EH2GxH54Gdf78Fa9DI5TDleccgli+XDCsKYPGchKPP
         LyZGgYaUzR8IYwZfRSq2NETM+r+Q4RbR03r2nIbf24A1cmR/+/W5u/bhUKGpYHU9vi7h
         4ECyH7cO+TU8vRQ6bQ9Go5f4ZG6iBUsod+6Gcx4cw2tc3cW0Y8GN1Du0rCzaKZdg2E86
         PU1n+uSmi3jhvF4hTExyhAhw3MzR7MJhpxg/RVH2Si7NuvuEa3KKsna7NTeQWtkXD7tr
         afTnULYqQxCT2ikPtBRfGVxyaSqXK/xOcQf68ez6grLoMiUGXgY5TKk29iSMydSNBmwf
         1KIQ==
X-Gm-Message-State: AOJu0Yyf6PosOqmmCRCWzfdRrD9zOHXjMDdpgETcAK4/uklOFJnk9y7c
	zrC4bzqU8WcXQtHatY9xNdtEQ+ChwZaa39/uWfJCgh1ENdMzkg+nFps0oLv80FlsYEIZlWxIzoE
	Wc+5vozolSGVclFKNy8WISHWMo5gzU3SFuYD2N832Zcu4ZHFHChMXKtR/PN90vqw5gvnnpbc=
X-Gm-Gg: AY/fxX6uF/vyXFJwdYpf5IARcSmYYBaoitxmAbt91AhawRN+2wsYJYYFOCVdHUxHYYb
	bPZprCE7Q31Dr5rQQ1U/irDMkJMXuJtabrrHtZCpowCQgjUc+NZ+KdeNcJOq8N1IJk83XmDSfzP
	fu2jh2P1SoqtecgqX7D0Hn1OfUeWd8Y1kEbOGbzvzUW8oXEaX8Y8GtG9fAELPLYQBne9eXsmwIN
	wfhUMFMwar7vTW6rT7Us9RQLuCoN6yXVfkjYak4gxLXJTi94hfC9+h908mdPt4YSiYfh5nL0c+v
	Hq3N2y//qagPbNmUFejSH75xTNS/ft/AFo3tN2t7pILJxAGe233GxAGzghq9NZmlmyPZarPxz6t
	ct03ZLs1+x1adgVGSkUDtSfNyxSiyZ4tUIRBDvS/q8YapIw2+JwVaWcBJ5xR/NQC81qQ49QZv3f
	WRdTOFGYhnlHmp6olp6pW/Gag=
X-Received: by 2002:a05:620a:7019:b0:8b2:7435:f5ef with SMTP id af79cd13be357-8bb3a2324b8mr627486885a.41.1765594691445;
        Fri, 12 Dec 2025 18:58:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEixWd08vn2bfN5Q0c6h8KkH4YB1uq6AVWB5FaWdaJdJUUMYCZtyOxxZPy/Eq4lN5P+Tyqnlg==
X-Received: by 2002:a05:620a:7019:b0:8b2:7435:f5ef with SMTP id af79cd13be357-8bb3a2324b8mr627483685a.41.1765594690575;
        Fri, 12 Dec 2025 18:58:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f3194dcesm2547067e87.79.2025.12.12.18.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 18:58:08 -0800 (PST)
Date: Sat, 13 Dec 2025 04:58:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pooja Katiyar <pooja.katiyar@intel.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH v5 1/4] usb: typec: ucsi: Update UCSI structure to have
 message in and message out fields
Message-ID: <2tlusuyqp2jif37smm57skeo3g2trzdspirv6minlopo5cey7m@z23tworiljkg>
References: <cover.1761773881.git.pooja.katiyar@intel.com>
 <214b0a90c3220db33084ab714f4f33a004f70a41.1761773881.git.pooja.katiyar@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <214b0a90c3220db33084ab714f4f33a004f70a41.1761773881.git.pooja.katiyar@intel.com>
X-Authority-Analysis: v=2.4 cv=O400fR9W c=1 sm=1 tr=0 ts=693cd644 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=cVougTJtD4grJz3r:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=-8siwrTlubNxkh0bKAwA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 8q_FyvS8mpWtNisYbuzhJIwz4d8NGVJL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyNCBTYWx0ZWRfX1IOv2a+I9vv5
 M6X/l7Sq5hKkF4ovq89i4UNAUi+whXgQSSXN8VqgCaS84IGyNo/CksieFsczgepYors5r/ShdYw
 IoeL19jIeJldavjALLTGMMjjApDJZDp9JCkoHkcRDVBX9rk2Sy2FMCSBNKmi1mLUL72AEyvypI9
 PYu2C9CZdO3SPRMT6E+EOpPvyiN5qRhnEPZ4OEOKuaVGNmuhhwuBQtHesj+tSxe9CnPK/Jv4X8Z
 qje2PwpoLzMBIkfNaCASIsuCsR67ZmCTDK4OZIOs9VbNYoBxFqaqmYZ+RK3D22VE78NB8NP2P6i
 KI87nELZgmxM+LAyAFOG/k87u2NLlc3GvGtz7iz5u6/sODwiVj7Ra3syo2A+xuM7Gx2fT0TXm71
 pt4DG9Ugz0BKSTz97/p9/gq2WT0CVQ==
X-Proofpoint-ORIG-GUID: 8q_FyvS8mpWtNisYbuzhJIwz4d8NGVJL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_07,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512130024

On Thu, Oct 30, 2025 at 07:48:55AM -0700, Pooja Katiyar wrote:
> Update UCSI structure by adding fields for incoming and outgoing
> messages. Update .sync_control function and other related functions
> to use these new fields within the UCSI structure, instead of handling
> them as separate parameters.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
> ---
> Changelog v3:
> - Added message fields to UCSI structure and updated sync_control handling.

Colleagues, after looking at this patch I have a question. What prevents
message_{in,out}{,_size} to be modified concurrently? While we have PPM
lock around command submission, size fields and buffers are modified /
accessed outside of the lock. Granted all the notifications and async
nature of the UCSI and USB-C protocols, what prevents two commands from
being executed at the same time with one of the execution threads
accessing the results returned by the other command?

In other words:

- thread A sets message_in_size, calls ucsi_send_command(CMD_A), which
  takes PPM lock

   - meanwhile thread B writes another value to message_in_size and
     calls ucsi_send_command(CMD_B), which now waits on PPM lock

- thread A finishes execution of the CMD_A, copies data (with the
  wrong size!) to the message_in_buf, then it releases PPM lock.

- thread A gets preempted

    - thread B gets scheduled, it takes PPM lock, executes CMD_B, gets
      data into the message_in_buf and finally it releases PPM lock

- finally at some later point thread A gets scheduled, it accesses
  message_in_buf, reading data that has been overwritten by CMD_B
  execution.

WDYT?

> 
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c   |   5 +-
>  drivers/usb/typec/ucsi/debugfs.c        |   9 +-
>  drivers/usb/typec/ucsi/displayport.c    |  11 ++-
>  drivers/usb/typec/ucsi/ucsi.c           | 104 ++++++++++++++++--------
>  drivers/usb/typec/ucsi/ucsi.h           |  19 +++--
>  drivers/usb/typec/ucsi/ucsi_acpi.c      |   9 +-
>  drivers/usb/typec/ucsi/ucsi_ccg.c       |  11 ++-
>  drivers/usb/typec/ucsi/ucsi_yoga_c630.c |  15 ++--
>  8 files changed, 112 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> index eed2a7d0ebc6..d753f2188e25 100644
> --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> @@ -105,13 +105,12 @@ static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
>  	return 0;
>  }
>  
> -static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd, u32 *cci,
> -				  void *data, size_t size)
> +static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd, u32 *cci)
>  {
>  	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
>  	int ret;
>  
> -	ret = ucsi_sync_control_common(ucsi, cmd, cci, data, size);
> +	ret = ucsi_sync_control_common(ucsi, cmd, cci);
>  	switch (ret) {
>  	case -EBUSY:
>  		/* EC may return -EBUSY if CCI.busy is set.
> diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
> index f73f2b54554e..4bf3a8f65a4e 100644
> --- a/drivers/usb/typec/ucsi/debugfs.c
> +++ b/drivers/usb/typec/ucsi/debugfs.c
> @@ -36,7 +36,8 @@ static int ucsi_cmd(void *data, u64 val)
>  	case UCSI_SET_NEW_CAM:
>  	case UCSI_SET_USB:
>  	case UCSI_READ_POWER_LEVEL:
> -		ret = ucsi_send_command(ucsi, val, NULL, 0);
> +		ucsi->message_in_size = 0;
> +		ret = ucsi_send_command(ucsi, val);
>  		break;
>  	case UCSI_GET_CAPABILITY:
>  	case UCSI_GET_CONNECTOR_CAPABILITY:
> @@ -51,9 +52,9 @@ static int ucsi_cmd(void *data, u64 val)
>  	case UCSI_GET_ATTENTION_VDO:
>  	case UCSI_GET_CAM_CS:
>  	case UCSI_GET_LPM_PPM_INFO:
> -		ret = ucsi_send_command(ucsi, val,
> -					&ucsi->debugfs->response,
> -					sizeof(ucsi->debugfs->response));
> +		ucsi->message_in_size = sizeof(ucsi->debugfs->response);
> +		ret = ucsi_send_command(ucsi, val);
> +		memcpy(&ucsi->debugfs->response, ucsi->message_in, sizeof(ucsi->debugfs->response));
>  		break;
>  	default:
>  		ret = -EOPNOTSUPP;
> diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
> index 8aae80b457d7..a09b4900ec76 100644
> --- a/drivers/usb/typec/ucsi/displayport.c
> +++ b/drivers/usb/typec/ucsi/displayport.c
> @@ -67,11 +67,14 @@ static int ucsi_displayport_enter(struct typec_altmode *alt, u32 *vdo)
>  	}
>  
>  	command = UCSI_GET_CURRENT_CAM | UCSI_CONNECTOR_NUMBER(dp->con->num);
> -	ret = ucsi_send_command(ucsi, command, &cur, sizeof(cur));
> +	ucsi->message_in_size = sizeof(cur);
> +	ret = ucsi_send_command(ucsi, command);
>  	if (ret < 0) {
>  		if (ucsi->version > 0x0100)
>  			goto err_unlock;
>  		cur = 0xff;
> +	} else {
> +		memcpy(&cur, ucsi->message_in, ucsi->message_in_size);
>  	}
>  
>  	if (cur != 0xff) {
> @@ -126,7 +129,8 @@ static int ucsi_displayport_exit(struct typec_altmode *alt)
>  	}
>  
>  	command = UCSI_CMD_SET_NEW_CAM(dp->con->num, 0, dp->offset, 0);
> -	ret = ucsi_send_command(dp->con->ucsi, command, NULL, 0);
> +	dp->con->ucsi->message_in_size = 0;
> +	ret = ucsi_send_command(dp->con->ucsi, command);
>  	if (ret < 0)
>  		goto out_unlock;
>  
> @@ -193,7 +197,8 @@ static int ucsi_displayport_configure(struct ucsi_dp *dp)
>  
>  	command = UCSI_CMD_SET_NEW_CAM(dp->con->num, 1, dp->offset, pins);
>  
> -	return ucsi_send_command(dp->con->ucsi, command, NULL, 0);
> +	dp->con->ucsi->message_in_size = 0;
> +	return ucsi_send_command(dp->con->ucsi, command);
>  }
>  
>  static int ucsi_displayport_vdm(struct typec_altmode *alt,
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index ed23edab7763..ee0c0d77e67d 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -55,8 +55,7 @@ void ucsi_notify_common(struct ucsi *ucsi, u32 cci)
>  }
>  EXPORT_SYMBOL_GPL(ucsi_notify_common);
>  
> -int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
> -			     void *data, size_t size)
> +int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci)
>  {
>  	bool ack = UCSI_COMMAND(command) == UCSI_ACK_CC_CI;
>  	int ret;
> @@ -84,9 +83,10 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
>  	if (!ret && cci)
>  		ret = ucsi->ops->read_cci(ucsi, cci);
>  
> -	if (!ret && data &&
> +	if (!ret && ucsi->message_in_size > 0 &&
>  	    (*cci & UCSI_CCI_COMMAND_COMPLETE))
> -		ret = ucsi->ops->read_message_in(ucsi, data, size);
> +		ret = ucsi->ops->read_message_in(ucsi, ucsi->message_in,
> +						 ucsi->message_in_size);
>  
>  	return ret;
>  }
> @@ -103,23 +103,25 @@ static int ucsi_acknowledge(struct ucsi *ucsi, bool conn_ack)
>  		ctrl |= UCSI_ACK_CONNECTOR_CHANGE;
>  	}
>  
> -	return ucsi->ops->sync_control(ucsi, ctrl, NULL, NULL, 0);
> +	ucsi->message_in_size = 0;
> +	return ucsi->ops->sync_control(ucsi, ctrl, NULL);
>  }
>  
> -static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
> -			    void *data, size_t size, bool conn_ack)
> +static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci, bool conn_ack)
>  {
>  	int ret, err;
>  
>  	*cci = 0;
>  
> -	if (size > UCSI_MAX_DATA_LENGTH(ucsi))
> +	if (ucsi->message_in_size > UCSI_MAX_DATA_LENGTH(ucsi))
>  		return -EINVAL;
>  
> -	ret = ucsi->ops->sync_control(ucsi, command, cci, data, size);
> +	ret = ucsi->ops->sync_control(ucsi, command, cci);
>  
> -	if (*cci & UCSI_CCI_BUSY)
> -		return ucsi_run_command(ucsi, UCSI_CANCEL, cci, NULL, 0, false) ?: -EBUSY;
> +	if (*cci & UCSI_CCI_BUSY) {
> +		ucsi->message_in_size = 0;
> +		return ucsi_run_command(ucsi, UCSI_CANCEL, cci, false) ?: -EBUSY;
> +	}
>  	if (ret)
>  		return ret;
>  
> @@ -151,10 +153,13 @@ static int ucsi_read_error(struct ucsi *ucsi, u8 connector_num)
>  	int ret;
>  
>  	command = UCSI_GET_ERROR_STATUS | UCSI_CONNECTOR_NUMBER(connector_num);
> -	ret = ucsi_run_command(ucsi, command, &cci, &error, sizeof(error), false);
> +	ucsi->message_in_size = sizeof(error);
> +	ret = ucsi_run_command(ucsi, command, &cci, false);
>  	if (ret < 0)
>  		return ret;
>  
> +	memcpy(&error, ucsi->message_in, sizeof(error));
> +
>  	switch (error) {
>  	case UCSI_ERROR_INCOMPATIBLE_PARTNER:
>  		return -EOPNOTSUPP;
> @@ -200,8 +205,7 @@ static int ucsi_read_error(struct ucsi *ucsi, u8 connector_num)
>  	return -EIO;
>  }
>  
> -static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd,
> -				    void *data, size_t size, bool conn_ack)
> +static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd, bool conn_ack)
>  {
>  	u8 connector_num;
>  	u32 cci;
> @@ -229,7 +233,7 @@ static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd,
>  
>  	mutex_lock(&ucsi->ppm_lock);
>  
> -	ret = ucsi_run_command(ucsi, cmd, &cci, data, size, conn_ack);
> +	ret = ucsi_run_command(ucsi, cmd, &cci, conn_ack);
>  
>  	if (cci & UCSI_CCI_ERROR)
>  		ret = ucsi_read_error(ucsi, connector_num);
> @@ -238,10 +242,9 @@ static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd,
>  	return ret;
>  }
>  
> -int ucsi_send_command(struct ucsi *ucsi, u64 command,
> -		      void *data, size_t size)
> +int ucsi_send_command(struct ucsi *ucsi, u64 command)
>  {
> -	return ucsi_send_command_common(ucsi, command, data, size, false);
> +	return ucsi_send_command_common(ucsi, command, false);
>  }
>  EXPORT_SYMBOL_GPL(ucsi_send_command);
>  
> @@ -319,7 +322,8 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
>  	int i;
>  
>  	command = UCSI_GET_CURRENT_CAM | UCSI_CONNECTOR_NUMBER(con->num);
> -	ret = ucsi_send_command(con->ucsi, command, &cur, sizeof(cur));
> +	con->ucsi->message_in_size = sizeof(cur);
> +	ret = ucsi_send_command(con->ucsi, command);
>  	if (ret < 0) {
>  		if (con->ucsi->version > 0x0100) {
>  			dev_err(con->ucsi->dev,
> @@ -327,6 +331,8 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
>  			return;
>  		}
>  		cur = 0xff;
> +	} else {
> +		memcpy(&cur, con->ucsi->message_in, sizeof(cur));
>  	}
>  
>  	if (cur < UCSI_MAX_ALTMODES)
> @@ -510,7 +516,8 @@ ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
>  		command |= UCSI_GET_ALTMODE_RECIPIENT(recipient);
>  		command |= UCSI_GET_ALTMODE_CONNECTOR_NUMBER(con->num);
>  		command |= UCSI_GET_ALTMODE_OFFSET(i);
> -		len = ucsi_send_command(con->ucsi, command, &alt, sizeof(alt));
> +		ucsi->message_in_size = sizeof(alt);
> +		len = ucsi_send_command(con->ucsi, command);
>  		/*
>  		 * We are collecting all altmodes first and then registering.
>  		 * Some type-C device will return zero length data beyond last
> @@ -519,6 +526,8 @@ ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
>  		if (len < 0)
>  			return len;
>  
> +		memcpy(&alt, ucsi->message_in, sizeof(alt));
> +
>  		/* We got all altmodes, now break out and register them */
>  		if (!len || !alt.svid)
>  			break;
> @@ -586,12 +595,15 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
>  		command |= UCSI_GET_ALTMODE_RECIPIENT(recipient);
>  		command |= UCSI_GET_ALTMODE_CONNECTOR_NUMBER(con->num);
>  		command |= UCSI_GET_ALTMODE_OFFSET(i);
> -		len = ucsi_send_command(con->ucsi, command, alt, sizeof(alt));
> +		con->ucsi->message_in_size = sizeof(alt);
> +		len = ucsi_send_command(con->ucsi, command);
>  		if (len == -EBUSY)
>  			continue;
>  		if (len <= 0)
>  			return len;
>  
> +		memcpy(&alt, con->ucsi->message_in, sizeof(alt));
> +
>  		/*
>  		 * This code is requesting one alt mode at a time, but some PPMs
>  		 * may still return two. If that happens both alt modes need be
> @@ -659,7 +671,9 @@ static int ucsi_get_connector_status(struct ucsi_connector *con, bool conn_ack)
>  			  UCSI_MAX_DATA_LENGTH(con->ucsi));
>  	int ret;
>  
> -	ret = ucsi_send_command_common(con->ucsi, command, &con->status, size, conn_ack);
> +	con->ucsi->message_in_size = size;
> +	ret = ucsi_send_command_common(con->ucsi, command, conn_ack);
> +	memcpy(&con->status, con->ucsi->message_in, size);
>  
>  	return ret < 0 ? ret : 0;
>  }
> @@ -682,8 +696,9 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
>  	command |= UCSI_GET_PDOS_PDO_OFFSET(offset);
>  	command |= UCSI_GET_PDOS_NUM_PDOS(num_pdos - 1);
>  	command |= is_source(role) ? UCSI_GET_PDOS_SRC_PDOS : 0;
> -	ret = ucsi_send_command(ucsi, command, pdos + offset,
> -				num_pdos * sizeof(u32));
> +	ucsi->message_in_size = num_pdos * sizeof(u32);
> +	ret = ucsi_send_command(ucsi, command);
> +	memcpy(pdos + offset, ucsi->message_in, num_pdos * sizeof(u32));
>  	if (ret < 0 && ret != -ETIMEDOUT)
>  		dev_err(ucsi->dev, "UCSI_GET_PDOS failed (%d)\n", ret);
>  
> @@ -770,7 +785,9 @@ static int ucsi_get_pd_message(struct ucsi_connector *con, u8 recipient,
>  		command |= UCSI_GET_PD_MESSAGE_BYTES(len);
>  		command |= UCSI_GET_PD_MESSAGE_TYPE(type);
>  
> -		ret = ucsi_send_command(con->ucsi, command, data + offset, len);
> +		con->ucsi->message_in_size = len;
> +		ret = ucsi_send_command(con->ucsi, command);
> +		memcpy(data + offset, con->ucsi->message_in, len);
>  		if (ret < 0)
>  			return ret;
>  	}
> @@ -935,7 +952,9 @@ static int ucsi_register_cable(struct ucsi_connector *con)
>  	int ret;
>  
>  	command = UCSI_GET_CABLE_PROPERTY | UCSI_CONNECTOR_NUMBER(con->num);
> -	ret = ucsi_send_command(con->ucsi, command, &cable_prop, sizeof(cable_prop));
> +	con->ucsi->message_in_size = sizeof(cable_prop);
> +	ret = ucsi_send_command(con->ucsi, command);
> +	memcpy(&cable_prop, con->ucsi->message_in, sizeof(cable_prop));
>  	if (ret < 0) {
>  		dev_err(con->ucsi->dev, "GET_CABLE_PROPERTY failed (%d)\n", ret);
>  		return ret;
> @@ -996,7 +1015,9 @@ static int ucsi_check_connector_capability(struct ucsi_connector *con)
>  		return 0;
>  
>  	command = UCSI_GET_CONNECTOR_CAPABILITY | UCSI_CONNECTOR_NUMBER(con->num);
> -	ret = ucsi_send_command(con->ucsi, command, &con->cap, sizeof(con->cap));
> +	con->ucsi->message_in_size = sizeof(con->cap);
> +	ret = ucsi_send_command(con->ucsi, command);
> +	memcpy(&con->cap, con->ucsi->message_in, sizeof(con->cap));
>  	if (ret < 0) {
>  		dev_err(con->ucsi->dev, "GET_CONNECTOR_CAPABILITY failed (%d)\n", ret);
>  		return ret;
> @@ -1357,7 +1378,8 @@ static int ucsi_reset_connector(struct ucsi_connector *con, bool hard)
>  	else if (con->ucsi->version >= UCSI_VERSION_2_0)
>  		command |= hard ? 0 : UCSI_CONNECTOR_RESET_DATA_VER_2_0;
>  
> -	return ucsi_send_command(con->ucsi, command, NULL, 0);
> +	con->ucsi->message_in_size = 0;
> +	return ucsi_send_command(con->ucsi, command);
>  }
>  
>  static int ucsi_reset_ppm(struct ucsi *ucsi)
> @@ -1438,7 +1460,8 @@ static int ucsi_role_cmd(struct ucsi_connector *con, u64 command)
>  {
>  	int ret;
>  
> -	ret = ucsi_send_command(con->ucsi, command, NULL, 0);
> +	con->ucsi->message_in_size = 0;
> +	ret = ucsi_send_command(con->ucsi, command);
>  	if (ret == -ETIMEDOUT) {
>  		u64 c;
>  
> @@ -1446,7 +1469,8 @@ static int ucsi_role_cmd(struct ucsi_connector *con, u64 command)
>  		ucsi_reset_ppm(con->ucsi);
>  
>  		c = UCSI_SET_NOTIFICATION_ENABLE | con->ucsi->ntfy;
> -		ucsi_send_command(con->ucsi, c, NULL, 0);
> +		con->ucsi->message_in_size = 0;
> +		ucsi_send_command(con->ucsi, c);
>  
>  		ucsi_reset_connector(con, true);
>  	}
> @@ -1599,10 +1623,13 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
>  	/* Get connector capability */
>  	command = UCSI_GET_CONNECTOR_CAPABILITY;
>  	command |= UCSI_CONNECTOR_NUMBER(con->num);
> -	ret = ucsi_send_command(ucsi, command, &con->cap, sizeof(con->cap));
> +	ucsi->message_in_size = sizeof(con->cap);
> +	ret = ucsi_send_command(ucsi, command);
>  	if (ret < 0)
>  		goto out_unlock;
>  
> +	memcpy(&con->cap, ucsi->message_in, sizeof(con->cap));
> +
>  	if (UCSI_CONCAP(con, OPMODE_DRP))
>  		cap->data = TYPEC_PORT_DRD;
>  	else if (UCSI_CONCAP(con, OPMODE_DFP))
> @@ -1795,17 +1822,20 @@ static int ucsi_init(struct ucsi *ucsi)
>  	/* Enable basic notifications */
>  	ntfy = UCSI_ENABLE_NTFY_CMD_COMPLETE | UCSI_ENABLE_NTFY_ERROR;
>  	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
> -	ret = ucsi_send_command(ucsi, command, NULL, 0);
> +	ucsi->message_in_size = 0;
> +	ret = ucsi_send_command(ucsi, command);
>  	if (ret < 0)
>  		goto err_reset;
>  
>  	/* Get PPM capabilities */
>  	command = UCSI_GET_CAPABILITY;
> -	ret = ucsi_send_command(ucsi, command, &ucsi->cap,
> -				BITS_TO_BYTES(UCSI_GET_CAPABILITY_SIZE));
> +	ucsi->message_in_size = BITS_TO_BYTES(UCSI_GET_CAPABILITY_SIZE);
> +	ret = ucsi_send_command(ucsi, command);
>  	if (ret < 0)
>  		goto err_reset;
>  
> +	memcpy(&ucsi->cap, ucsi->message_in, BITS_TO_BYTES(UCSI_GET_CAPABILITY_SIZE));
> +
>  	if (!ucsi->cap.num_connectors) {
>  		ret = -ENODEV;
>  		goto err_reset;
> @@ -1835,7 +1865,8 @@ static int ucsi_init(struct ucsi *ucsi)
>  	/* Enable all supported notifications */
>  	ntfy = ucsi_get_supported_notifications(ucsi);
>  	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
> -	ret = ucsi_send_command(ucsi, command, NULL, 0);
> +	ucsi->message_in_size = 0;
> +	ret = ucsi_send_command(ucsi, command);
>  	if (ret < 0)
>  		goto err_unregister;
>  
> @@ -1886,7 +1917,8 @@ static void ucsi_resume_work(struct work_struct *work)
>  
>  	/* Restore UCSI notification enable mask after system resume */
>  	command = UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;
> -	ret = ucsi_send_command(ucsi, command, NULL, 0);
> +	ucsi->message_in_size = 0;
> +	ret = ucsi_send_command(ucsi, command);
>  	if (ret < 0) {
>  		dev_err(ucsi->dev, "failed to re-enable notifications (%d)\n", ret);
>  		return;
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index 35993bc34d4d..76343285be59 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -29,6 +29,10 @@ struct dentry;
>  #define UCSI_MESSAGE_OUT		32
>  #define UCSIv2_MESSAGE_OUT		272
>  
> +/* Define maximum lengths for message buffers */
> +#define UCSI_MAX_MESSAGE_IN_LENGTH	256
> +#define UCSI_MAX_MESSAGE_OUT_LENGTH	256
> +
>  /* UCSI versions */
>  #define UCSI_VERSION_1_0	0x0100
>  #define UCSI_VERSION_1_1	0x0110
> @@ -80,8 +84,7 @@ struct ucsi_operations {
>  	int (*read_cci)(struct ucsi *ucsi, u32 *cci);
>  	int (*poll_cci)(struct ucsi *ucsi, u32 *cci);
>  	int (*read_message_in)(struct ucsi *ucsi, void *val, size_t val_len);
> -	int (*sync_control)(struct ucsi *ucsi, u64 command, u32 *cci,
> -			    void *data, size_t size);
> +	int (*sync_control)(struct ucsi *ucsi, u64 command, u32 *cci);
>  	int (*async_control)(struct ucsi *ucsi, u64 command);
>  	bool (*update_altmodes)(struct ucsi *ucsi, u8 recipient,
>  				struct ucsi_altmode *orig,
> @@ -489,6 +492,12 @@ struct ucsi {
>  	unsigned long quirks;
>  #define UCSI_NO_PARTNER_PDOS	BIT(0)	/* Don't read partner's PDOs */
>  #define UCSI_DELAY_DEVICE_PDOS	BIT(1)	/* Reading PDOs fails until the parter is in PD mode */
> +
> +	/* Fixed-size buffers for incoming and outgoing messages */
> +	u8 message_in[UCSI_MAX_MESSAGE_IN_LENGTH];
> +	size_t message_in_size;
> +	u8 message_out[UCSI_MAX_MESSAGE_OUT_LENGTH];
> +	size_t message_out_size;
>  };
>  
>  #define UCSI_MAX_DATA_LENGTH(u) (((u)->version < UCSI_VERSION_2_0) ? 0x10 : 0xff)
> @@ -551,15 +560,13 @@ struct ucsi_connector {
>  	struct usb_pd_identity cable_identity;
>  };
>  
> -int ucsi_send_command(struct ucsi *ucsi, u64 command,
> -		      void *retval, size_t size);
> +int ucsi_send_command(struct ucsi *ucsi, u64 command);
>  
>  void ucsi_altmode_update_active(struct ucsi_connector *con);
>  int ucsi_resume(struct ucsi *ucsi);
>  
>  void ucsi_notify_common(struct ucsi *ucsi, u32 cci);
> -int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
> -			     void *data, size_t size);
> +int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci);
>  
>  #if IS_ENABLED(CONFIG_POWER_SUPPLY)
>  int ucsi_register_port_psy(struct ucsi_connector *con);
> diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
> index 6b92f296e985..f1d1f6917b09 100644
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@ -105,15 +105,14 @@ static const struct ucsi_operations ucsi_acpi_ops = {
>  	.async_control = ucsi_acpi_async_control
>  };
>  
> -static int ucsi_gram_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
> -				  void *val, size_t len)
> +static int ucsi_gram_sync_control(struct ucsi *ucsi, u64 command, u32 *cci)
>  {
>  	u16 bogus_change = UCSI_CONSTAT_POWER_LEVEL_CHANGE |
>  			   UCSI_CONSTAT_PDOS_CHANGE;
>  	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
>  	int ret;
>  
> -	ret = ucsi_sync_control_common(ucsi, command, cci, val, len);
> +	ret = ucsi_sync_control_common(ucsi, command, cci);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -125,8 +124,8 @@ static int ucsi_gram_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
>  	if (UCSI_COMMAND(ua->cmd) == UCSI_GET_CONNECTOR_STATUS &&
>  	    ua->check_bogus_event) {
>  		/* Clear the bogus change */
> -		if (*(u16 *)val == bogus_change)
> -			*(u16 *)val = 0;
> +		if (*(u16 *)ucsi->message_in == bogus_change)
> +			*(u16 *)ucsi->message_in = 0;
>  
>  		ua->check_bogus_event = false;
>  	}
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index d83a0051c737..ead1b2a25c79 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -606,8 +606,7 @@ static int ucsi_ccg_async_control(struct ucsi *ucsi, u64 command)
>  	return ccg_write(uc, reg, (u8 *)&command, sizeof(command));
>  }
>  
> -static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
> -				 void *data, size_t size)
> +static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci)
>  {
>  	struct ucsi_ccg *uc = ucsi_get_drvdata(ucsi);
>  	struct ucsi_connector *con;
> @@ -629,16 +628,16 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
>  		ucsi_ccg_update_set_new_cam_cmd(uc, con, &command);
>  	}
>  
> -	ret = ucsi_sync_control_common(ucsi, command, cci, data, size);
> +	ret = ucsi_sync_control_common(ucsi, command, cci);
>  
>  	switch (UCSI_COMMAND(command)) {
>  	case UCSI_GET_CURRENT_CAM:
>  		if (uc->has_multiple_dp)
> -			ucsi_ccg_update_get_current_cam_cmd(uc, (u8 *)data);
> +			ucsi_ccg_update_get_current_cam_cmd(uc, (u8 *)ucsi->message_in);
>  		break;
>  	case UCSI_GET_ALTERNATE_MODES:
>  		if (UCSI_ALTMODE_RECIPIENT(command) == UCSI_RECIPIENT_SOP) {
> -			struct ucsi_altmode *alt = data;
> +			struct ucsi_altmode *alt = (struct ucsi_altmode *)ucsi->message_in;
>  
>  			if (alt[0].svid == USB_TYPEC_NVIDIA_VLINK_SID)
>  				ucsi_ccg_nvidia_altmode(uc, alt, command);
> @@ -646,7 +645,7 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
>  		break;
>  	case UCSI_GET_CAPABILITY:
>  		if (uc->fw_build == CCG_FW_BUILD_NVIDIA_TEGRA) {
> -			struct ucsi_capability *cap = data;
> +			struct ucsi_capability *cap = (struct ucsi_capability *)ucsi->message_in;
>  
>  			cap->features &= ~UCSI_CAP_ALT_MODE_DETAILS;
>  		}
> diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> index 0187c1c4b21a..299081444caa 100644
> --- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> +++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> @@ -88,8 +88,7 @@ static int yoga_c630_ucsi_async_control(struct ucsi *ucsi, u64 command)
>  
>  static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi,
>  				       u64 command,
> -				       u32 *cci,
> -				       void *data, size_t size)
> +				       u32 *cci)
>  {
>  	int ret;
>  
> @@ -107,8 +106,8 @@ static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi,
>  		};
>  
>  		dev_dbg(ucsi->dev, "faking DP altmode for con1\n");
> -		memset(data, 0, size);
> -		memcpy(data, &alt, min(sizeof(alt), size));
> +		memset(ucsi->message_in, 0, ucsi->message_in_size);
> +		memcpy(ucsi->message_in, &alt, min(sizeof(alt), ucsi->message_in_size));
>  		*cci = UCSI_CCI_COMMAND_COMPLETE | UCSI_SET_CCI_LENGTH(sizeof(alt));
>  		return 0;
>  	}
> @@ -121,18 +120,18 @@ static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi,
>  	if (UCSI_COMMAND(command) == UCSI_GET_ALTERNATE_MODES &&
>  	    UCSI_GET_ALTMODE_GET_CONNECTOR_NUMBER(command) == 2) {
>  		dev_dbg(ucsi->dev, "ignoring altmodes for con2\n");
> -		memset(data, 0, size);
> +		memset(ucsi->message_in, 0, ucsi->message_in_size);
>  		*cci = UCSI_CCI_COMMAND_COMPLETE;
>  		return 0;
>  	}
>  
> -	ret = ucsi_sync_control_common(ucsi, command, cci, data, size);
> +	ret = ucsi_sync_control_common(ucsi, command, cci);
>  	if (ret < 0)
>  		return ret;
>  
>  	/* UCSI_GET_CURRENT_CAM is off-by-one on all ports */
> -	if (UCSI_COMMAND(command) == UCSI_GET_CURRENT_CAM && data)
> -		((u8 *)data)[0]--;
> +	if (UCSI_COMMAND(command) == UCSI_GET_CURRENT_CAM && ucsi->message_in_size > 0)
> +		ucsi->message_in[0]--;
>  
>  	return ret;
>  }
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

