Return-Path: <linux-usb+bounces-28720-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FCEBA4DE6
	for <lists+linux-usb@lfdr.de>; Fri, 26 Sep 2025 20:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C13181C040CD
	for <lists+linux-usb@lfdr.de>; Fri, 26 Sep 2025 18:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9135130C62A;
	Fri, 26 Sep 2025 18:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jYfYDEcq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355D12773FC
	for <linux-usb@vger.kernel.org>; Fri, 26 Sep 2025 18:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758910761; cv=none; b=UKpoCOvVg7X8QAHDB2KFOXdOBvwP+V+o7LYMq3pP5eU3i5I8FF8rAQ058LA4BqPBI7TQ2Zh+7u6/4IhsV6RWGfITheQlB4dU5n4CNJhYmvaPzbjDsddYCaDW5Qg7VydFz/ey4csVEBKe6+5ZixgHIs90OLQKRiuMSpbJ4XU3XT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758910761; c=relaxed/simple;
	bh=6MmXObhartxTKBIJxPnOvuJOiEQeaG+QxajNTKgUPhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jPYBm06qBgPR41BBwHri+KrUiJFv455kOryI3ZWPEu8xNXyWaWOLccyyn2oUjvf+AzITOxkLCmhxkZyh0AJOx6r4OkyCuOlJXUT2AysCowAsrZ0hwFuBfS4hv/oq0KetDBckRoTBfi6J5dE6O6VUa+ydWLEaC/RVIU49TmD7IRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jYfYDEcq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEX948011364
	for <linux-usb@vger.kernel.org>; Fri, 26 Sep 2025 18:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	blZigSJg8fUUIgUvfYWVJAQVHVIs1fx8MnzwUqxJoO8=; b=jYfYDEcqrEOKd4sl
	Zh8LOKEClpvMplj3i128n/SrsNADz/hFJ7FFuHJhqtRUFY/ldO8DHbiZYo/h4FW2
	fteEAhlOrdJrJT4fKhi3gECHJ/N2A6F1AuDFHCaNoupjnT7NnSJAy/IuTOhwTtAr
	zVxKUHonU7hlD77JXt2pSW25upgFlvmXBJlqEwBI9GiFRuxpmuSeRUAtP4CepkW9
	xumNt8YtiqWyaYfV1mdii7BHzaFutFxf5ncSDtPiVio0o/GJsLdD/AguKlbA2/Hq
	E8QJPzAgJvib+E1Sjiqvq0jnLxV1kfzGWphu9SO/vs5iD4ZMXaJrJHOLTFGtQEJL
	cxYAyQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db323r8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 26 Sep 2025 18:19:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b54d0ffd16eso1712426a12.3
        for <linux-usb@vger.kernel.org>; Fri, 26 Sep 2025 11:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758910756; x=1759515556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=blZigSJg8fUUIgUvfYWVJAQVHVIs1fx8MnzwUqxJoO8=;
        b=f8i6L62Xd8VPenFFOg0PEGRy5gcTIwrIRTa28ReJ8Ld8NfI0Y7GeR38w4v+P0u3hKg
         9Zp832dTvc9cKp5VxvBWGJEzo/rElvcnHtpL8Q/5t5xe1GhbMYaPjUR5d6cLzNYOrbja
         dck9N/8pNdcNkZsjwQfsRvbrjDCwvr47JWSGO7CSp59gcm4DYigJBRLXi4TZt6tL5PAE
         NE4GB97ASOOUxcwdCDhWOKCZ2vrZWffZa3ri9QulNWO4jT4KPsghK1v0ygwLfcxqJsZA
         PAfdia3gea1KBsyOa4GMMRiCa3SsLmQ9AWehZ9mC5LZGtr+47j7tvTvdxWuf8sZKlOSC
         Af2g==
X-Forwarded-Encrypted: i=1; AJvYcCUHNv505HhNKVWcBP2uaM1xXSaSksNO8hP/5zSmW5FAVEPvTnpaBQb558cec6cTibWAnRLKXI27XiU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/g+7RGcJniQEIBOADKAAbi5nEk4HQ1Xvn/liz/EsX6KZ1UpMb
	XvMcdXXHEykz7nvf4Vrys+O5GBFMcKa9zoC0PxV6r2PT2lyeDDBJX/BRFwRxR1kNrnELCDgTLvc
	ltiJeLfBq6ebIBT0/5fMmkP0Y5KI/RL94pRXgV1z4hJTWz4K0OxlW86DHK8SaiIU=
X-Gm-Gg: ASbGnctW3g0l/EA3Dn3ijsemEa0Cq1zMrVIWKCdtBriEeALYNm6j4HnJH1MN2Gg7G5t
	oWSDR+NL64zcFKn+p1qIcIMXLgAUrRMpgLulFnq4QCtZNqzC+bszoUzwuOMWETzx5dFnxNMBxtk
	KVyzXA25aTnIB9XgQulfb2ixP6JBDor6nqHCAjWcQEG672+u2FpW7IYv6XSSP8z8iFeuOZdprRk
	xcqlNsCD2gJ6DTBlbN+SOBCtfE+apCn9zad8OKWomVILnbusYla5Ap59OAb4Z6LL4vs0wrcnMjg
	8AkiIbRERk8QgFeW0NAD6eXvjloKC5zYnIRbmkOzCT9h8rZIHZ+XR1fU72t3Tuj+Ui0Nt+/0sXk
	IorvlbZBiO0mVoKIrAGwwioRgxcZ7
X-Received: by 2002:a17:90b:1a86:b0:32e:e186:726d with SMTP id 98e67ed59e1d1-3342a2e08a1mr6706619a91.31.1758910756403;
        Fri, 26 Sep 2025 11:19:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlsoXvXI/7zk1yAQi3F3KN8R32lykMOeT61Rp7qbtH1i2VYM90nP0ueH+y0+T94R0288ihug==
X-Received: by 2002:a17:90b:1a86:b0:32e:e186:726d with SMTP id 98e67ed59e1d1-3342a2e08a1mr6706595a91.31.1758910755892;
        Fri, 26 Sep 2025 11:19:15 -0700 (PDT)
Received: from [10.71.112.90] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3347224b76csm6137691a91.9.2025.09.26.11.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 11:19:15 -0700 (PDT)
Message-ID: <4cbcf312-7697-4725-8fd8-45f2b5b0584f@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 11:19:13 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] usb: typec: ucsi_glink: Increase buffer size to
 support UCSI v2
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250924232631.644234-1-anjelique.melendez@oss.qualcomm.com>
 <20250924232631.644234-3-anjelique.melendez@oss.qualcomm.com>
 <t3hfr33t76ckecatro5gheycb2phnch57m6zzdpm44ibykbubd@e6nffasyetib>
Content-Language: en-US
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
In-Reply-To: <t3hfr33t76ckecatro5gheycb2phnch57m6zzdpm44ibykbubd@e6nffasyetib>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ao6/yCZV c=1 sm=1 tr=0 ts=68d6d925 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=CGcnTnl5F4JIPjVE0FQA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: aAhtoM4HlkoKowb2f-d7M1QQU1YW1WWx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfX8xRlce7Nup+G
 v5LfOZYNdHe8VLSp5zcN+OMdjQWtus8gZX+QP+XwVVW7bXES7Jo8merrcbJ6WSuam7F+m/ko0e/
 TPU7Twm+gy3zOvhokOqG1ClGxypCK2qy13+ZBlO8x2uLDH1zuJ/L4lT6J4K/zYpknjaLwUXg26X
 tnLf2yLRNguK4PZr4mS4z5adEAWdKJglL2ZvZZlO1N6xmi18MpiFs4v2oOFqEP+GXg5E/0FV1xV
 NoTvEnAkJYsNOOGPHhd3JQ4rX2RIVk02ixEJH5N1OTRdX5JQX3AtM6Mo9VvmvRVA6Fjm0A4tNn1
 o3Wtg60EblErPg4NpIycIn7sBEpP7FYztHCijYPydbM09dSMxWF46B0PMXmIra7/ICA06O/Np3Q
 3XTWa134VhGaMbJf+N2pA8m3PTP+wQ==
X-Proofpoint-GUID: aAhtoM4HlkoKowb2f-d7M1QQU1YW1WWx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_06,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172



On 9/25/2025 2:43 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 04:26:31PM -0700, Anjelique Melendez wrote:
>> UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
>> 16 bytes to 256 bytes each for the message exchange between OPM and PPM
>> This makes the total buffer size increase from 48 bytes to 528 bytes.
>> Update the buffer size to support this increase.
>>
>> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
>> ---
>>   drivers/usb/typec/ucsi/ucsi_glink.c | 81 ++++++++++++++++++++++++-----
>>   1 file changed, 68 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
>> index 1f9f0d942c1a..7f19b4d23fed 100644
>> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
>> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
>> @@ -16,10 +16,10 @@
>>   
>>   #define PMIC_GLINK_MAX_PORTS		3
>>   
>> -#define UCSI_BUF_SIZE                   48
>> +#define UCSI_BUF_V1_SIZE		(UCSI_MESSAGE_OUT + (UCSI_MESSAGE_OUT - UCSI_MESSAGE_IN))
>> +#define UCSI_BUF_V2_SIZE		(UCSIv2_MESSAGE_OUT + (UCSIv2_MESSAGE_OUT - UCSI_MESSAGE_IN))
>>   
>>   #define MSG_TYPE_REQ_RESP               1
>> -#define UCSI_BUF_SIZE                   48
>>   
>>   #define UC_NOTIFY_RECEIVER_UCSI         0x0
>>   #define UC_UCSI_READ_BUF_REQ            0x11
>> @@ -30,15 +30,27 @@ struct ucsi_read_buf_req_msg {
>>   	struct pmic_glink_hdr   hdr;
>>   };
>>   
>> -struct __packed ucsi_read_buf_resp_msg {
>> +struct __packed ucsi_v1_read_buf_resp_msg {
>>   	struct pmic_glink_hdr   hdr;
>> -	u8                      buf[UCSI_BUF_SIZE];
>> +	u8                      buf[UCSI_BUF_V1_SIZE];
>>   	u32                     ret_code;
>>   };
>>   
>> -struct __packed ucsi_write_buf_req_msg {
>> +struct __packed ucsi_v2_read_buf_resp_msg {
>>   	struct pmic_glink_hdr   hdr;
>> -	u8                      buf[UCSI_BUF_SIZE];
>> +	u8                      buf[UCSI_BUF_V2_SIZE];
>> +	u32                     ret_code;
>> +};
>> +
>> +struct __packed ucsi_v1_write_buf_req_msg {
>> +	struct pmic_glink_hdr   hdr;
>> +	u8                      buf[UCSI_BUF_V1_SIZE];
>> +	u32                     reserved;
>> +};
>> +
>> +struct __packed ucsi_v2_write_buf_req_msg {
>> +	struct pmic_glink_hdr   hdr;
>> +	u8                      buf[UCSI_BUF_V2_SIZE];
>>   	u32                     reserved;
>>   };
>>   
>> @@ -72,7 +84,7 @@ struct pmic_glink_ucsi {
>>   	bool ucsi_registered;
>>   	bool pd_running;
>>   
>> -	u8 read_buf[UCSI_BUF_SIZE];
>> +	u8 read_buf[UCSI_BUF_V2_SIZE];
>>   };
>>   
>>   static int pmic_glink_ucsi_read(struct ucsi *__ucsi, unsigned int offset,
>> @@ -131,18 +143,34 @@ static int pmic_glink_ucsi_read_message_in(struct ucsi *ucsi, void *val, size_t
>>   static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned int offset,
>>   					const void *val, size_t val_len)
>>   {
>> -	struct ucsi_write_buf_req_msg req = {};
>> -	unsigned long left;
>> +	struct ucsi_v2_write_buf_req_msg req = {};
>> +	unsigned long left, max_buf_len;
>> +	size_t req_len;
>>   	int ret;
>>   
>> +	memset(&req, 0, sizeof(req));
>>   	req.hdr.owner = PMIC_GLINK_OWNER_USBC;
>>   	req.hdr.type = MSG_TYPE_REQ_RESP;
>>   	req.hdr.opcode = UC_UCSI_WRITE_BUF_REQ;
>> +
>> +	if (ucsi->ucsi->version >= UCSI_VERSION_2_0) {
>> +		req_len = sizeof(struct ucsi_v2_write_buf_req_msg);
>> +		max_buf_len = UCSI_BUF_V2_SIZE;
> 
> I'd prefer it to be more explicit. Define an union of v1 and v2, fill
> common parts and version-specific parts separately.
Konrad also left a similar comment in this function "This code keeps the 
'reserved' field zeored out for v1, but it does so in a fragile and 
implicit way :/" 
(https://lore.kernel.org/all/df671650-a5af-4453-a11d-e8e2a32bd1ab@oss.qualcomm.com/#t)

So I figured I would try to get thoughts from the both of you :)

We could have a union defined like so:
struct __packed ucsi_write_buf_req_msg {
	struct pmic_glink_hdr   hdr;
	union {
		u8 v2_buf[UCSI_BUF_V2_SIZE];
		u8 v1_buf[UCSI_BUF_V1_SIZE];
	} buf;
	u32                     reserved;
};

and then ucsi_locked_write() pseudo would be something like this:

pmic_glink_ucsi_locked_write()
{
	struct ucsi_write_buf_req_msg req = {};
	u8 *buf;

	req.hdr.owner = PMIC_GLINK_OWNER_USBC;
	req.hdr.type = MSG_TYPE_REQ_RESP;
	req.hdr.opcode = UC_UCSI_WRITE_BUF_REQ;

	if (version >= UCSI_VERSION_2_0)
		buf_len = UCSI_BUF_V2_SIZE;
		buf = req.buf.v2_buf;
	else if (version)
		buf_len = UCSI_BUF_V1_SIZE;
		buf = req.buf.v1_buf;
	else
		return -EINVAL;
	req_len = sizeof(struct pmic_glink_hdr) + buf_len + sizeof(u32);

	memcpy(&buf[offset], val, val_len);

	ret = pmic_glink_send(ucsi->client, &req, req_len);
	if (ret < 0)
		return ret;

	left = wait_for_completion_timeout(&ucsi->write_ack, 5 * HZ);
	if (!left)
		return -ETIMEDOUT;

	return 0;
}

Since we are adding the union we still end up initializing space for the 
larger UCSI v2 buffer and when we have UCSI v1 we are only expected to 
send a request with buffer size = UCSI v1. With this we would still be 
keeping a reserved field zeroed for v1 but it still is not the 
req.reserved field being explicitly sent.

The only other solution I can think of that would be fully explicit is 
if we created pmic_glink_ucsi_v2_locked_write() which basically just did 
the exact same thing as the original pmic_glink_ucsi_locked_write() but 
instead used ucsi_v2_write_buf_req_msg struct. 
pmic_glink_ucsi_async_control() would then decide which locked_write 
function to call based on version. However that would include a lot of 
code copying.

Let me know what your thoughts are - I'm more than happy to go the way 
of the union but just want to make sure that we are all on same page and 
can agree on best steps forward :)

Thanks,
Anjelique

