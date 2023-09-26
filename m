Return-Path: <linux-usb+bounces-584-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2807AEA50
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 12:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id B53931C20880
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 10:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0F4200AE;
	Tue, 26 Sep 2023 10:27:41 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6D4B649
	for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 10:27:39 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A219B3
	for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 03:27:37 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38Q8ql31031908;
	Tue, 26 Sep 2023 10:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : cc : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=qL3gupeyKl49N8xJc0HYVaLB1HxWVCmue95KtNawo7w=;
 b=TfOowaXgpOxTASfjTUZetvPZGA0T3IsTA4yhvxu7UlzRLkzoAxzBDlN/Rn22fAMGkX6w
 XD3le1VtxUr6kb5aYlPdrTDvRjgzl6s3wAgmYE820WSF2uPNqcBuf4g6WmB3Qj011J2U
 s+iR6qXFIIWoFzoH1+3eo1RLrHMT04AkcIvXU0CAYG8y8gzM6XSQCFP15uXiociRL+iU
 5bkKTNyyPHhxdGxxjfzCzLhUk3V3MpnIXsnEtQwQ9v38OPW3qOlsMVs+laet1IJ1ReRe
 0nebN5Kup/GAnKAUGt4bPQdj9Z0aGvuKtglL5M98ZDR5D2suOtZ0A2OWjdY/UwVlHktk dw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tbv6607a0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Sep 2023 10:27:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38QARVmG028466
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Sep 2023 10:27:31 GMT
Received: from [10.216.21.104] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 26 Sep
 2023 03:27:30 -0700
Message-ID: <b338633b-83d0-465b-bdc0-e1ad7219897c@quicinc.com>
Date: Tue, 26 Sep 2023 15:57:26 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: gadget: ncm: Handle decoding of multiple NTB's in
 unwrap call
To: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
References: <20230926063015.21189-1-quic_kriskura@quicinc.com>
 <CANP3RGccr8gjf9suTOP=CBH+TqFv_AhD3FBBh_D_bryEMUA_CA@mail.gmail.com>
 <0e9b6b56-f261-462b-98cc-c7e9ce6b4091@quicinc.com>
 <CANP3RGep1vAyqJfRa4QRhxzO=Pcpeso+UZtYwfkCLjyH6hAvDA@mail.gmail.com>
Content-Language: en-US
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <CANP3RGep1vAyqJfRa4QRhxzO=Pcpeso+UZtYwfkCLjyH6hAvDA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nC5dOOVN0C392n72E7ZHMwyImen5neHA
X-Proofpoint-GUID: nC5dOOVN0C392n72E7ZHMwyImen5neHA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_07,2023-09-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309260091
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 9/26/2023 2:10 PM, Maciej Żenczykowski wrote:
> On Tue, Sep 26, 2023 at 12:35 AM Krishna Kurapati PSSNV
> <quic_kriskura@quicinc.com> wrote:
>> On 9/26/2023 12:19 PM, Maciej Żenczykowski wrote:
>>> On Mon, Sep 25, 2023 at 11:30 PM Krishna Kurapati
>>> <quic_kriskura@quicinc.com> wrote:
>>>>
>>>> When NCM is used with hosts like Windows PC, it is observed that there are
>>>> multiple NTB's contained in one usb request giveback. Since the driver
>>>> unwraps the obtained request data assuming only one NTB is present, we
>>>> loose the subsequent NTB's present resulting in data loss.
>>>>
>>>> Fix this by checking the parsed block length with the obtained data
>>>> length in usb request and continue parsing after the last byte of current
>>>> NTB.
>>>>
>>>> Cc: stable@vger.kernel.org
>>>> Fixes: 9f6ce4240a2b ("usb: gadget: f_ncm.c added")
>>>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>>>> ---
>>>> Changes in v3: Removed explicit typecast for ntb_ptr
>>>>
>>>>    drivers/usb/gadget/function/f_ncm.c | 26 +++++++++++++++++++-------
>>>>    1 file changed, 19 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
>>>> index 424bb3b666db..9512cec662c8 100644
>>>> --- a/drivers/usb/gadget/function/f_ncm.c
>>>> +++ b/drivers/usb/gadget/function/f_ncm.c
>>>> @@ -1171,7 +1171,8 @@ static int ncm_unwrap_ntb(struct gether *port,
>>>>                             struct sk_buff_head *list)
>>>>    {
>>>>           struct f_ncm    *ncm = func_to_ncm(&port->func);
>>>> -       __le16          *tmp = (void *) skb->data;
>>>> +       unsigned char   *ntb_ptr = skb->data;
>>>> +       __le16          *tmp;
>>>>           unsigned        index, index2;
>>>>           int             ndp_index;
>>>>           unsigned        dg_len, dg_len2;
>>>> @@ -1184,6 +1185,10 @@ static int ncm_unwrap_ntb(struct gether *port,
>>>>           const struct ndp_parser_opts *opts = ncm->parser_opts;
>>>>           unsigned        crc_len = ncm->is_crc ? sizeof(uint32_t) : 0;
>>>>           int             dgram_counter;
>>>> +       int             to_process = skb->len;
>>>> +
>>>> +parse_ntb:
>>>> +       tmp = (void *)ntb_ptr;
>>>
>>> Yeah this works, but really it should just be
>>> tmp = (__le16 *)ntb_ptr;
>>>
>>
>> Hi Maciej,
>>
>>    Agree, it must be __le16*  but I wanted to keep things similar to what
>> was in original function. Do you want me to try with __le16* ?
> 
> I think proper casts are usually better than void*...
> Could you resend if it works?  Compile test should be enough.
> 
>> And I think you missed adding mailing list in CC. Can I add them on CC ?
> 
> It wasn't intentional, normally gmail defaults to reply all, so not
> sure what happened.
> Go ahead.
> 
Sure. Will test with __le16* and see if it works. If it does, will send it.

And CC'ing linux-usb list as well on these replies.

Thanks,
Krishna,
>>
>> Regards,
>> Krishna,
>>>>
>>>>           /* dwSignature */
>>>>           if (get_unaligned_le32(tmp) != opts->nth_sign) {
>>>> @@ -1230,7 +1235,7 @@ static int ncm_unwrap_ntb(struct gether *port,
>>>>                    * walk through NDP
>>>>                    * dwSignature
>>>>                    */
>>>> -               tmp = (void *)(skb->data + ndp_index);
>>>> +               tmp = (void *)(ntb_ptr + ndp_index);
>>> ditto
>>>>                   if (get_unaligned_le32(tmp) != ncm->ndp_sign) {
>>>>                           INFO(port->func.config->cdev, "Wrong NDP SIGN\n");
>>>>                           goto err;
>>>> @@ -1287,11 +1292,11 @@ static int ncm_unwrap_ntb(struct gether *port,
>>>>                           if (ncm->is_crc) {
>>>>                                   uint32_t crc, crc2;
>>>>
>>>> -                               crc = get_unaligned_le32(skb->data +
>>>> +                               crc = get_unaligned_le32(ntb_ptr +
>>>>                                                            index + dg_len -
>>>>                                                            crc_len);
>>>>                                   crc2 = ~crc32_le(~0,
>>>> -                                                skb->data + index,
>>>> +                                                ntb_ptr + index,
>>>>                                                    dg_len - crc_len);
>>>>                                   if (crc != crc2) {
>>>>                                           INFO(port->func.config->cdev,
>>>> @@ -1318,7 +1323,7 @@ static int ncm_unwrap_ntb(struct gether *port,
>>>>                                                            dg_len - crc_len);
>>>>                           if (skb2 == NULL)
>>>>                                   goto err;
>>>> -                       skb_put_data(skb2, skb->data + index,
>>>> +                       skb_put_data(skb2, ntb_ptr + index,
>>>>                                        dg_len - crc_len);
>>>>
>>>>                           skb_queue_tail(list, skb2);
>>>> @@ -1331,10 +1336,17 @@ static int ncm_unwrap_ntb(struct gether *port,
>>>>                   } while (ndp_len > 2 * (opts->dgram_item_len * 2));
>>>>           } while (ndp_index);
>>>>
>>>> -       dev_consume_skb_any(skb);
>>>> -
>>>>           VDBG(port->func.config->cdev,
>>>>                "Parsed NTB with %d frames\n", dgram_counter);
>>>> +
>>>> +       to_process -= block_len;
>>>> +       if (to_process != 0) {
>>>
>>> you don't really need this != 0, but I guess that's just stylistic preference.
>>>
>>>> +               ntb_ptr = (unsigned char *)(ntb_ptr + block_len);
>>>> +               goto parse_ntb;
>>>> +       }
>>>> +
>>>> +       dev_consume_skb_any(skb);
>>>> +
>>>>           return 0;
>>>>    err:
>>>>           skb_queue_purge(list);
>>>> --
>>>> 2.42.0Maciej Żenczykowski, Kernel Networking Developer @ Google

