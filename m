Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC8A6E1A56
	for <lists+linux-usb@lfdr.de>; Fri, 14 Apr 2023 04:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbjDNC2a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Apr 2023 22:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbjDNC2Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Apr 2023 22:28:25 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.215])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4361D3C15
        for <linux-usb@vger.kernel.org>; Thu, 13 Apr 2023 19:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
        Content-Type; bh=j8YhHfJP509KCyUugJQTri2AlVuDLAYO3B/+QqwpGDM=;
        b=ZOaDQK/HVn2UmbOmeIcK2IsSJan3lBtyhLGEdBR5GIyVqzy7mK01W5gQZGF4Wt
        T9TX9Z5+NiYKF1XPC9PvOh4ZeyY6iJLIjmy5z1P0xvfwBiYo6KbCkCUX9chvGyMF
        NW+9lzTg9hJvVXY2pyCCCUdoka8gU6muKa22H9j4pHR6I=
Received: from [172.21.25.67] (unknown [218.201.129.19])
        by zwqz-smtp-mta-g4-2 (Coremail) with SMTP id _____wCnXrofujhkKWt+BQ--.14870S2;
        Fri, 14 Apr 2023 10:27:43 +0800 (CST)
Message-ID: <47160c97-dbc4-2061-f890-df3e57281df0@163.com>
Date:   Fri, 14 Apr 2023 10:27:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: BUG: linux 5.15.0 hang on usb_wwan_indat_callback
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Bin Liu <b-liu@ti.com>
References: <580d8541-1eca-e7b1-ccf5-66eda3e88761@163.com>
 <2023041257-campfire-squeamish-75a4@gregkh>
 <de92552a-3148-03c0-5b4b-94040d8d7969@163.com>
 <9a64f19c-c8c6-4e42-b226-717b1983693b@rowland.harvard.edu>
Content-Language: en-US
From:   qianfan <qianfanguijin@163.com>
In-Reply-To: <9a64f19c-c8c6-4e42-b226-717b1983693b@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnXrofujhkKWt+BQ--.14870S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrurW5Jr1fCry5Xr1fCFy5XFb_yoWxZrcEv3
        yqkw1kGw42yrnrZ3ZxJrWvqFW5JF95Wa1UCFnIg3Z8Z3Wjq3yUJw10qFZ5tF93ZF15tF9r
        ur4jvr92vrs7ZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj7PEDUUUUU==
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXQNR7VWBpO-GTwAAs0
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



在 2023/4/13 21:46, Alan Stern 写道:
> On Thu, Apr 13, 2023 at 12:50:12PM +0800, qianfan wrote:
>> The resubmit logic in usb_wwan_indat_callback semms need improve:
>>
>> if (status) {
>>      dev_dbg(dev, "%s: nonzero status: %d on endpoint %02x.\n",
>>          __func__, status, endpoint);
>>
>>      /* don't resubmit on fatal errors */
>>      if (status == -ESHUTDOWN || status == -ENOENT)
>>          return;
>> }
>>
>> maybe this patch is better?
>>
>> switch (status) {
>> case -ESHOTDOWN:
>> case -ENOENT:
>> case -ECONNRESET:
>> case -EOVERFLOW:
>> case -EPROTO:
>>      reutrn;
>> }
> In fact, it would be better to treat any error you don't recognize as a
> fatal error.
I think it is a good idea.
>
> Alan Stern

