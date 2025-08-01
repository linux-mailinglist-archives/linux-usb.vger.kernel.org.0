Return-Path: <linux-usb+bounces-26326-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9D7B18962
	for <lists+linux-usb@lfdr.de>; Sat,  2 Aug 2025 01:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 656EB62587A
	for <lists+linux-usb@lfdr.de>; Fri,  1 Aug 2025 23:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A356222F74E;
	Fri,  1 Aug 2025 23:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="guzpOauZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA851917E3
	for <linux-usb@vger.kernel.org>; Fri,  1 Aug 2025 23:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754090307; cv=none; b=GTVtiP1AcLAWwXnq7dEWGnzGDsrtzQQmGP3RyU1xNpvoWJMA3+gniqKAIkYGCj0upUDlxqIqZ3cprw3PDahocAiPgsWixZ42qw/KTA98m5WJblUOTeE2dE8HeLhgYjJKpe7GtR1aMYmIYMRYTxlPSn7KM7pgWkwUKMDufkANcQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754090307; c=relaxed/simple;
	bh=KfW2pjyXjwbhHAG1+rUm82EIhrLsxH3wOyneKuccBmE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MJJdMePp0Ked+D2NFQTY1E5i2fMy+zP6/Czcc/Il4WU605xgVKdvg9k/neDzut5nQKsBy1PhCMKfSc3n3Nog/9UumfwfT6PEV9irxx4qyJJcF1nH6NIPyEeT30CtXdlARfGBY0xWJAq4VFEhhI/qZ8PJEqf1bzTyGgdInGwfafg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=guzpOauZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571Lg8pY017230
	for <linux-usb@vger.kernel.org>; Fri, 1 Aug 2025 23:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RSUWbofeDMNLabFSHa1cdVIt/PhMfOuSeGfNa48oSAQ=; b=guzpOauZzG7pgJb/
	srnEJthgjCLT47tMDHApDS+HhOkGis+tXNtPaS7M5t4RidOkygEuBzkBOM80ciiE
	0lmTmU90QAash0kXGkpkcYj3u0OO7e86dcHI+SnYK0FU8WxpZhQjL9fN861VpfRQ
	YgVrIgyMb4N5CWtpD3KacwiD1+kfTs/1i/6u1BadODZToKgk6is9vaaRoCwjdAO3
	q3Ee5PjREO/X4nB/K6dxIH8nUr5o5WlEAuyYHGZVUL57QBRKI2Ukw/CwgKVM8W2f
	fC3htXM0ZsAKOrcfgNRnIU1WTFgYa08fgcD+U6GE/nONL9BJVonFcHF/ssuJvU78
	iIocIQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q86dqw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 01 Aug 2025 23:18:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31ebadfb7f2so2647656a91.1
        for <linux-usb@vger.kernel.org>; Fri, 01 Aug 2025 16:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754090302; x=1754695102;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RSUWbofeDMNLabFSHa1cdVIt/PhMfOuSeGfNa48oSAQ=;
        b=OVkAsgNZ3w21ZThpl3vB/BjuN+iojPDexcvDMYl/uFGHi+SMfssNJd1SBKYd3k/Sot
         6etlYH656vuSsHWdBjrG4cyHl1FzrCXyZpjBXttr+aWEnU4M09x5GuW8hiXbu/OsZOMf
         +9L5nOCLWQefA0ckFyPd23gL1ukV9XkzHIf93QCXJinJYpBi4SkhgEPm281mTxA1TNkX
         Ht4ShXJRdWXd77PfFV8p5Mc5WA145IaKAU2SXtdQpQ9UNvJVcYTEsTxHVNh8Rlyy5tQa
         ULLn/HDdKE8GLacrckXHk3AgR4p9BMY8icDXFJsgP9rwFSCivUupqEAsZKQYOH9qlcC7
         uURg==
X-Forwarded-Encrypted: i=1; AJvYcCXlLOaIkUEO+7zjzCKEFEU6bo4qpDj+qWAvJg21XfAD/wGUrinhKq8QdVYUfhFDZN8oWP0XbXKOZ8w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yydzrq4FeU6RfDGxxbpncPT9FzavnG4FIlTgZ8Wa5KnkAP20++3
	hepy29lwnILPt0tTy7rHD9lgowdODTGH8S8RCwOFku+7WuslQrMQK/77+p8n0bCDmlymLw2M3j/
	NN2VdReRoRCD3nVJoGOboHI8a6Y9/Uvv7mC9NPagGWzbvQ1fBlnB9RecTU48W7+A=
X-Gm-Gg: ASbGncueiNr4860bksEvUCmikX1KuxFoznck6Yq4fTQtD9nm//TP5YqlaobDnlzTrxE
	RI61wD47vApoIXtmrrOKCDHyV9np1dc53kYG3QuByWbI0uXO4P6E8U5AmfLYW3DuiwVIHv+vuao
	mB2sCWLwIPbYOaZceRBj9HCVH310Ij5lC8bCuTv3mX0exKGftpICkZM8WdXTGbOMmf+jJOlSRPy
	BAH2/XWkPYQFg9mW+mxlIrujwtO5Hoaaj/xL4Xb+3woZvq4ou3UM/fBF/I/w2N17KUnfk+244xf
	41IVPAMFGvVgGEEVyvd2CsZlegoix6K0Kwgg7vJmTTq1Ah5jdr387CObCV8N2vyfTy80ONO9kbR
	kchlfS6DBbFPD8pbnXdMsJk1Q3dMfFQ==
X-Received: by 2002:a17:90b:1c8a:b0:31f:4aab:3b25 with SMTP id 98e67ed59e1d1-321161ea5afmr1697865a91.1.1754090302428;
        Fri, 01 Aug 2025 16:18:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaw+IzVQFtuco638l8PBl0yq8QYW5BbiEwlT/HEF2/oekik+r3ajg4VxoiXZng3TYDn0nhew==
X-Received: by 2002:a17:90b:1c8a:b0:31f:4aab:3b25 with SMTP id 98e67ed59e1d1-321161ea5afmr1697831a91.1.1754090301908;
        Fri, 01 Aug 2025 16:18:21 -0700 (PDT)
Received: from [10.71.113.238] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3209a849935sm5652221a91.33.2025.08.01.16.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 16:18:20 -0700 (PDT)
Message-ID: <bfd5c9c2-ba3d-4222-8586-9620aa2ec898@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 16:18:19 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: ucsi_glink: Increase buffer size to
 support UCSI v2
To: Greg KH <gregkh@linuxfoundation.org>
Cc: heikki.krogerus@linux.intel.com, lumag@kernel.org,
        neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250716005224.312155-1-anjelique.melendez@oss.qualcomm.com>
 <2025071600-configure-ambush-c139@gregkh>
Content-Language: en-US
In-Reply-To: <2025071600-configure-ambush-c139@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDE4NiBTYWx0ZWRfX6oWa0H2j88v/
 JLorjJM6hv6oIJcrtS03y0GrkJ4aNJYq7N6SU53phOS5y6lMrO73zP7DL8lAmFmmg/66LYoDFqS
 YaysHNj9XXBMPuJoqHv8OfwzFRaPdk9oSjql1NqcuYNuUH7Kt19uFLQDXRd1CTTP/ffB0cz55Ed
 kYn5+82REDOHoiUgC5NvbQQLp8Jq15AVeP8Cnlp0rRnBKH3hBrbaBmb1eiuQ4910oVzkZuc12d3
 bjydIIg6VXLYZNUH4sAzJnWB8g6YhwF+AZohuae48Rdn+4hKaFkl/1QVVXbX1xFOkozCTT3wr6g
 rlBDXmUIE9P+k9XG7EZ/YVnfmizky0WYSkiE/jN/OkQOKwzMUBPnpp59uYGWatDKENokni8Jckp
 U0XWw7BuMBtWdikscjeJItwLT2DYPjthxK/aSh/DCW7BxNfdlhscey0867hCUQ943wr8xhSx
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=688d4b3f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=EddbWebGST1xqQYBUU0A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: opt_ySTpdSbTZ9n1X2E2ouISIaaEy6r5
X-Proofpoint-GUID: opt_ySTpdSbTZ9n1X2E2ouISIaaEy6r5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=831 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010186



On 7/15/2025 10:06 PM, Greg KH wrote:
> On Tue, Jul 15, 2025 at 05:52:24PM -0700, Anjelique Melendez wrote:
>> UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
>> 16 bytes to 256 bytes each for the message exchange between OPM and PPM
>> This makes the total buffer size increase from 48 bytes to 528 bytes.
>> Update the buffer size to support this increase.
>>
>> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
>> ---
>> Changes since v1:
>>   - Defined buf size in terms of other UCSI defines
>>   - Removed UCSI_BUF_SIZE and used the explicit v1 or v2 buffer size macros
>>   - Removed Qualcomm copyright
>>   - link: https://lore.kernel.org/all/20250624222922.2010820-1-anjelique.melendez@oss.qualcomm.com/
>> ---
>>   drivers/usb/typec/ucsi/ucsi_glink.c | 58 ++++++++++++++++++++++++-----
>>   1 file changed, 48 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
>> index 8af79101a2fc..2918c88e54d2 100644
>> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
>> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
>> @@ -16,10 +16,10 @@
>>   
>>   #define PMIC_GLINK_MAX_PORTS		3
>>   
>> -#define UCSI_BUF_SIZE                   48
>> +#define UCSI_BUF_V1_SIZE               (UCSI_MESSAGE_OUT + (UCSI_MESSAGE_OUT - UCSI_MESSAGE_IN))
>> +#define UCSI_BUF_V2_SIZE               (UCSIv2_MESSAGE_OUT + (UCSIv2_MESSAGE_OUT - UCSI_MESSAGE_IN))
>>   
>>   #define MSG_TYPE_REQ_RESP               1
>> -#define UCSI_BUF_SIZE                   48
>>   
>>   #define UC_NOTIFY_RECEIVER_UCSI         0x0
>>   #define UC_UCSI_READ_BUF_REQ            0x11
>> @@ -32,13 +32,25 @@ struct ucsi_read_buf_req_msg {
>>   
>>   struct ucsi_read_buf_resp_msg {
>>   	struct pmic_glink_hdr   hdr;
>> -	u8                      buf[UCSI_BUF_SIZE];
>> +	u8                      buf[UCSI_BUF_V1_SIZE];
>> +	u32                     ret_code;
> 
> What is the endian-ness of ret_code as it comes from the device?

ret_code is little endian but since ret_code = 0 on success we only ever 
check " if (ret_code)" and return early if there is any error.

>> +};
>> +
>> +struct ucsi_v2_read_buf_resp_msg {
>> +	struct pmic_glink_hdr   hdr;
>> +	u8                      buf[UCSI_BUF_V2_SIZE];
>>   	u32                     ret_code;
>>   };
>>   
>>   struct ucsi_write_buf_req_msg {
>>   	struct pmic_glink_hdr   hdr;
>> -	u8                      buf[UCSI_BUF_SIZE];
>> +	u8                      buf[UCSI_BUF_V1_SIZE];
>> +	u32                     reserved;
> 
> What is "reserved" for?  What is it set to?  Where is it tested to
> ensure it is set properly?
The reserved property is part of the message format defined by the 
charger FW(PPM). We do not set it explicitly but I will add length 
checks to our write requests to ensure we do not write to this property.
> 
>> +};
>> +
>> +struct ucsi_v2_write_buf_req_msg {
>> +	struct pmic_glink_hdr   hdr;
>> +	u8                      buf[UCSI_BUF_V2_SIZE];
>>   	u32                     reserved;
>>   };
> 
> And for all of these structures, are you sure there are not "holes" in
> them?  As you are using sizeof(), don't they need to be packed?
> 
Ack - will update to be packed

>>   
>> @@ -72,7 +84,7 @@ struct pmic_glink_ucsi {
>>   	bool ucsi_registered;
>>   	bool pd_running;
>>   
>> -	u8 read_buf[UCSI_BUF_SIZE];
>> +	u8 read_buf[UCSI_BUF_V2_SIZE];
> 
> Why is this one just v2 and not also v1?
  Read_buf[] is used to read back the read_requests. If we added a 
separate read buffer for v2 we would need to add more logic into 
pmic_glink_ucsi_read() and pmic_glink_ucsi_read_ack(). By setting 
read_buf[] to the maximum buffer size (v2) then we can reuse this buffer 
for v1 and v2 and code reuse will be cleaner.

> 
>>   };
>>   
>>   static int pmic_glink_ucsi_read(struct ucsi *__ucsi, unsigned int offset,
>> @@ -131,8 +143,9 @@ static int pmic_glink_ucsi_read_message_in(struct ucsi *ucsi, void *val, size_t
>>   static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned int offset,
>>   					const void *val, size_t val_len)
>>   {
>> -	struct ucsi_write_buf_req_msg req = {};
>> +	struct ucsi_v2_write_buf_req_msg req = {};
>>   	unsigned long left;
>> +	size_t len;
>>   	int ret;
>>   
>>   	req.hdr.owner = PMIC_GLINK_OWNER_USBC;
>> @@ -142,7 +155,18 @@ static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned i
>>   
>>   	reinit_completion(&ucsi->write_ack);
>>   
>> -	ret = pmic_glink_send(ucsi->client, &req, sizeof(req));
>> +	if (!ucsi->ucsi->version || ucsi->ucsi->version >= UCSI_VERSION_2_1) {
>> +		/* If UCSI version is unknown, use the maximum buffer size */
>> +		len = sizeof(req);
>> +	} else {
>> +		/*
>> +		 * If UCSI V1, buffer size should be UCSI_BUF_V1_SIZE so update
>> +		 * len accordingly
>> +		 */
>> +		len = sizeof(struct ucsi_write_buf_req_msg);
>> +	}
>> +
>> +	ret = pmic_glink_send(ucsi->client, &req, len);
>>   	if (ret < 0) {
>>   		dev_err(ucsi->dev, "failed to send UCSI write request: %d\n", ret);
>>   		return ret;
>> @@ -216,12 +240,26 @@ static const struct ucsi_operations pmic_glink_ucsi_ops = {
>>   
>>   static void pmic_glink_ucsi_read_ack(struct pmic_glink_ucsi *ucsi, const void *data, int len)
>>   {
>> -	const struct ucsi_read_buf_resp_msg *resp = data;
>> +	const struct ucsi_v2_read_buf_resp_msg *resp = data;
>> +	u32 ret_code, buffer_len;
>> +
>> +	if (!ucsi->ucsi->version || ucsi->ucsi->version >= UCSI_VERSION_2_1) {
>> +		/* If UCSI version is unknown, use the maximum buffer size */
>> +		ret_code = resp->ret_code;
> 
> No endian change?

We only check if ret_code == 0, so no need for endian change

> 
>> +		buffer_len = UCSI_BUF_V2_SIZE;
> 
> Shouldn't you warn about this?  Doesn't the version have to be set?
Version is set from a read_request during ucsi_register(). This would be 
the first read_request we receive and should be the only time we do not 
know the version. Will add the ucsi->ucsi_registered var to enforce that 
version is unknown ONLY before ucsi_register() otherwise warn/return error.
> 
> 
>> +	} else {
>> +		/*
>> +		 * If UCSI V1, use UCSI_BUF_V1_SIZE buffer size and
>> +		 * update ret_code offset accordingly
>> +		 */
>> +		ret_code = ((struct ucsi_read_buf_resp_msg *)data)->ret_code;
> 
> Are you sure the buffer was that big?  Where was that checked?
ACK - will add length checks

> 
>> +		buffer_len = UCSI_BUF_V1_SIZE;
>> +	}
>>   
>> -	if (resp->ret_code)
>> +	if (ret_code)
>>   		return;
>>   
>> -	memcpy(ucsi->read_buf, resp->buf, UCSI_BUF_SIZE);
>> +	memcpy(ucsi->read_buf, resp->buf, buffer_len);
> 
> Where is the length checked against the "real" length of the buffer
> passed in here?  What happens if the device lies?
> 
Ack - will add length checks
> thanks,
> 
> greg k-h


