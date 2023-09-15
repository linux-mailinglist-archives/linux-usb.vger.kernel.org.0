Return-Path: <linux-usb+bounces-174-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D5C7A27FA
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 22:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C8141C20EEF
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 20:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1071B27B;
	Fri, 15 Sep 2023 20:21:34 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB05E11CA6
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 20:21:32 +0000 (UTC)
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A791270A
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 13:21:05 -0700 (PDT)
Received: from eig-obgw-6004a.ext.cloudfilter.net ([10.0.30.197])
	by cmsmtp with ESMTP
	id hAOdqzo6eDKaKhFJJqISsx; Fri, 15 Sep 2023 20:21:05 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id hFJIqEGCyp9rehFJIqaCLq; Fri, 15 Sep 2023 20:21:04 +0000
X-Authority-Analysis: v=2.4 cv=Ztv+lv3G c=1 sm=1 tr=0 ts=6504bcb0
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=ag1SF4gXAAAA:8 a=pF3H81QlAAAA:8 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=cm27Pg_UAAAA:8 a=HvF037n1xESchLcPDVoA:9 a=QEXdDO2ut3YA:10
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=6mx6MrwIfq_fzEhb4BAB:22 a=TjNXssC_j7lpFel5tvFf:22
 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nfbBbmChWyKNzoVj9/7lddkMlBXcM7IRZVK5hnelGKY=; b=L0dzUqc2X5mdOQrmM9CUYp+Ptm
	W9pqrDo8YisAJrcQWf7OqliJM64b/It0e2DZEwZS9SgmMuTfGQpOrMGuQqqQdYQPZS0ggYPMJRlBS
	L2nDON/27v1LN38z9OQZDOlIDShRL39XIrhfsYHdX//UlZLT22A4e4d8L0ufSiZNuPUNHHmBamPIU
	YxqWO4WAyUrLDHuB1keNHFAE//OCHXaH3tHUqCOkf5FNPnrQla0zw4lOpHj2ihJ91CT501bC/3SiY
	y1myxqw6wFh+/FzeIXFfIoUNkAm8ybXGsLihM/KJ8RwRs2KMt0isryxYtgUBUMa2+fyrMrssgy2Ei
	xoz2Dsgg==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:58950 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qhFJG-002EO4-32;
	Fri, 15 Sep 2023 15:21:02 -0500
Message-ID: <0b48fe61-7d05-1520-d77e-81ad39bc80b4@embeddedor.com>
Date: Fri, 15 Sep 2023 14:21:58 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] usb: gadget: f_fs: Annotate struct ffs_buffer with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: John Keeping <john@keeping.me.uk>,
 Udipto Goswami <quic_ugoswami@quicinc.com>,
 Linyu Yuan <quic_linyyuan@quicinc.com>, linux-usb@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Krishna Kurapati <quic_kriskura@quicinc.com>,
 Jeff Layton <jlayton@kernel.org>,
 Uttkarsh Aggarwal <quic_uaggarwa@quicinc.com>,
 Yuta Hayama <hayama@lineo.co.jp>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20230915195849.never.275-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915195849.never.275-kees@kernel.org>
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
X-Exim-ID: 1qhFJG-002EO4-32
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:58950
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 30
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJgckMOl+mEZZfsoD2t/qhLycct6CH7pNNflnluJuTX5iIPGB1tb3S6WMVAi0PMQj2v7UXMXYuP3Sl5HY1cJ7BdrNtBEBoPzlz3HNZrYjHOVNEPQC5GJ
 ujXbFgiN+7gcrgxCzjcpfzTgH8Cu3QsgCElQ1lKk/INfD9ucij0vouI1n+utNcrZQcAAPj4RUffzVaReqvqxRyPpcAH558vZrbs=
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 9/15/23 13:58, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct ffs_buffer.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: John Keeping <john@keeping.me.uk>
> Cc: Udipto Goswami <quic_ugoswami@quicinc.com>
> Cc: Linyu Yuan <quic_linyyuan@quicinc.com>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/usb/gadget/function/f_fs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 6e9ef35a43a7..af400d083777 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -202,7 +202,7 @@ struct ffs_epfile {
>   struct ffs_buffer {
>   	size_t length;
>   	char *data;
> -	char storage[];
> +	char storage[] __counted_by(length);
>   };
>   
>   /*  ffs_io_data structure ***************************************************/

