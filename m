Return-Path: <linux-usb+bounces-175-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4329B7A27FB
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 22:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A6D31C20EEF
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 20:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5601B27C;
	Fri, 15 Sep 2023 20:22:20 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB6218E0B
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 20:22:18 +0000 (UTC)
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4785AC
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 13:22:17 -0700 (PDT)
Received: from eig-obgw-6007a.ext.cloudfilter.net ([10.0.30.247])
	by cmsmtp with ESMTP
	id hFDGqMEyFEoVshFKTqHnRe; Fri, 15 Sep 2023 20:22:17 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id hFKSqfdCK7DhyhFKTqOzO7; Fri, 15 Sep 2023 20:22:17 +0000
X-Authority-Analysis: v=2.4 cv=fpfP2X0f c=1 sm=1 tr=0 ts=6504bcf9
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=ag1SF4gXAAAA:8 a=pF3H81QlAAAA:8 a=8AirrxEcAAAA:8 a=i0EeH86SAAAA:8
 a=pGLkceISAAAA:8 a=1XWaLZrsAAAA:8 a=R4ayLD03AAAA:8 a=VwQbUJbxAAAA:8
 a=cm27Pg_UAAAA:8 a=qjWHau5h7Oqj65Zv8QkA:9 a=QEXdDO2ut3YA:10
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=6mx6MrwIfq_fzEhb4BAB:22 a=ST-jHhOKWsTCqRlWije3:22
 a=qJlm0-shE6CLU_iKUWNr:22 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9PgJlnslMBgBGHbXac3jFXJfhvL12GXbFunGsm908Is=; b=pAtbiml4OUKujs4Wvsl6UOSf2a
	xP6fs6COMqDO4Dm8Te7Rg+8Oxx1WoI9b63AxqheIz1SADxFC0NuhO1lnCE3tyaRwlPdnPw2dvVO64
	Ww/FxU9yzSpkAPWfxBrRpRQM1Na2VF44asR3+k8c4O4AxMW08dZyXovPEi8gI4s6zT0F6V7dBNHyg
	g3/edsCF6sY1EJph3Z9i3blmpdPy3YEqXZXnaWq/kF+2fVhuXbsAZrtQG/yV+khAsVqKTViuL4FYY
	7aW5NdhU7TG7+w//5c1ODjfP9pbngP17Rw9v8r7y0CvatnGFVD0QaN39/Uf1x+fPhnoOGtVTF5U6w
	8Qe4JWNQ==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:39764 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qhFKR-002FFx-0y;
	Fri, 15 Sep 2023 15:22:15 -0500
Message-ID: <d8f80173-fed3-a6e3-7991-1bd61ed3af5d@embeddedor.com>
Date: Fri, 15 Sep 2023 14:23:10 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] usb: gadget: f_midi: Annotate struct f_midi with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: John Keeping <john@keeping.me.uk>, Peter Chen <peter.chen@nxp.com>,
 Hulk Robot <hulkci@huawei.com>, Allen Pais <allen.lkml@gmail.com>,
 Will McVicker <willmcvicker@google.com>, Davidlohr Bueso
 <dave@stgolabs.net>, Zhang Qilong <zhangqilong3@huawei.com>,
 linux-usb@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Linyu Yuan <quic_linyyuan@quicinc.com>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20230915195938.never.611-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915195938.never.611-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qhFKR-002FFx-0y
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:39764
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 43
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfElcD0FsqhVwVliuhyuH468+qzJtBMxudISIDke8ROpq62u9jUkY1bG9liTNNtKUamCvTQXGRZe7I7pMcsh4LuX5pYfCJoq9rfYZwIsJgmfDYufAf0Mp
 f6WSvvKItB+EzDcRHNDlSrXUtHhwarOOGrnHv5aY6ixesYgCaw9gRM8nx1iWhu2sX0/ZWrks3WbKd9QYbuFwyyqBy0SdonoAEgk=
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 9/15/23 13:59, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct f_midi.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: John Keeping <john@keeping.me.uk>
> Cc: Peter Chen <peter.chen@nxp.com>
> Cc: Hulk Robot <hulkci@huawei.com>
> Cc: Allen Pais <allen.lkml@gmail.com>
> Cc: Will McVicker <willmcvicker@google.com>
> Cc: Davidlohr Bueso <dave@stgolabs.net>
> Cc: Zhang Qilong <zhangqilong3@huawei.com>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/usb/gadget/function/f_midi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
> index 2d02f25f9597..033e347554db 100644
> --- a/drivers/usb/gadget/function/f_midi.c
> +++ b/drivers/usb/gadget/function/f_midi.c
> @@ -99,7 +99,7 @@ struct f_midi {
>   	unsigned int in_last_port;
>   	unsigned char free_ref;
>   
> -	struct gmidi_in_port	in_ports_array[/* in_ports */];
> +	struct gmidi_in_port	in_ports_array[] __counted_by(in_ports);
>   };
>   
>   static inline struct f_midi *func_to_midi(struct usb_function *f)
> @@ -1349,6 +1349,7 @@ static struct usb_function *f_midi_alloc(struct usb_function_instance *fi)
>   		status = -ENOMEM;
>   		goto setup_fail;
>   	}
> +	midi->in_ports = opts->in_ports;
>   
>   	for (i = 0; i < opts->in_ports; i++)
>   		midi->in_ports_array[i].cable = i;
> @@ -1359,7 +1360,6 @@ static struct usb_function *f_midi_alloc(struct usb_function_instance *fi)
>   		status = -ENOMEM;
>   		goto midi_free;
>   	}
> -	midi->in_ports = opts->in_ports;
>   	midi->out_ports = opts->out_ports;
>   	midi->index = opts->index;
>   	midi->buflen = opts->buflen;

