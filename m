Return-Path: <linux-usb+bounces-305-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 383D57A43B3
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 09:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 214061C20E3B
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 07:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5047E14271;
	Mon, 18 Sep 2023 07:57:31 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D6063CC
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 07:57:29 +0000 (UTC)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB08B3A90
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 00:54:48 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-41513d2cca7so417621cf.0
        for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 00:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695023687; x=1695628487; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMGyAzpf8lWJYYzHbLt9+b5ipto9IJqdYCL10HebZHQ=;
        b=g4ieQu7J41A4zlrCCV76NG7lEtF2KIDdobCcY2Oo1SMuKtw2zO0PhlBb1cFjLRpptZ
         xXH6eGJgnPHdZxYfwZC1ZSRp9MrHWL9ZgR+UHEIq7uxtxoo3CMVq+N2hSWSL7GAfREro
         9TipP18D36WdQ1Jpj3f644Kvil1Qa//DpFTGVTXgssMHC9pxKKUVruK1YuZyQUuvCwKK
         1CfVqeRd5w75JwuqoiyqGsOUyms+w0Raipw/JNv/wTVQh6I1Pq9GQGecZx1qn24fJnUD
         AGGMq+cK/Fil4/CsECbqR1SvMiyfG1nEWJ8328IrJws5Fu2NvvB7gH43KSwNuiZAlU0D
         uZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695023687; x=1695628487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMGyAzpf8lWJYYzHbLt9+b5ipto9IJqdYCL10HebZHQ=;
        b=VAYQNJItIgG9f4I9Sgrr5ATRspXeDuUsDTqm2yPwYdJf/rOo5BJso4D3F5vngyjfp7
         P/DJj2N2d7EtL5JYUJbC+Nz88QriYuauqAcnqcdei3Vi5OATb3ZK1JQB4Civ0gI6oDCQ
         Of09FIIHI2s2pJlfgiH0drjNNR95HnF8yGjzP/W4S89I7B6rsfaGV0mT5d2oYG5yUWqZ
         RE6Q/IvzNCIF7HUSPdH2OAp3EObWpHvgPTcU3pCDlDx7zNSdOswu20lQH70JNwMG0Fto
         Gf74t3+y3L1FQ4meR33X7orh05fPwvWWDQzjNqtrsz/XtgF8d/w3jOgCbw7CoBuLGl76
         Ofeg==
X-Gm-Message-State: AOJu0YyI8LZRfX2VljVJYON2rA1ZkyEJowQbohUmgGy8sGWf2tQcu9Hr
	kp5HN72x+JkdT46SPJvS+h3nPA7I7KYGaDZp6DSecw==
X-Google-Smtp-Source: AGHT+IGmchl1nhhkgAPJVlN8MWg99mK3RSwliCcA4VFxIvPmB3npsC4fC+lgedW2GVsOWOp+vxknSmD3LAa7S4pQ4/4=
X-Received: by 2002:a05:622a:1446:b0:410:8ba3:21c7 with SMTP id
 v6-20020a05622a144600b004108ba321c7mr410408qtx.18.1695023687484; Mon, 18 Sep
 2023 00:54:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230918074202.2461-426-nic_swsd@realtek.com> <20230918074202.2461-427-nic_swsd@realtek.com>
In-Reply-To: <20230918074202.2461-427-nic_swsd@realtek.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 18 Sep 2023 09:54:36 +0200
Message-ID: <CANn89iJmdkyn8_hU4esycRG-XvPa_Djsp6PyaOX5cYP1Obdr4g@mail.gmail.com>
Subject: Re: [PATCH net-next resend 1/2] r8152: remove queuing rx packets in driver
To: Hayes Wang <hayeswang@realtek.com>
Cc: kuba@kernel.org, davem@davemloft.net, netdev@vger.kernel.org, 
	nic_swsd@realtek.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	bjorn@mork.no, pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Sep 18, 2023 at 9:42=E2=80=AFAM Hayes Wang <hayeswang@realtek.com> =
wrote:
>
> The original way would process all rx and queue the rx packets in the
> driver. Now, the process would be broken if the budget is exhausted. And
> the remained list would be queue back to rx_done for next schedule.
>
> Signed-off-by: Hayes Wang <hayeswang@realtek.com>

This deserves a Fixes: tag

> ---
>  drivers/net/usb/r8152.c | 52 ++++++++++++-----------------------------
>  1 file changed, 15 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 0c13d9950cd8..ae46e7e46e39 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -871,7 +871,7 @@ struct r8152 {
>         struct tx_agg tx_info[RTL8152_MAX_TX];
>         struct list_head rx_info, rx_used;
>         struct list_head rx_done, tx_free;
> -       struct sk_buff_head tx_queue, rx_queue;
> +       struct sk_buff_head tx_queue;
>         spinlock_t rx_lock, tx_lock;
>         struct delayed_work schedule, hw_phy_work;
>         struct mii_if_info mii;
> @@ -2031,7 +2031,6 @@ static int alloc_all_mem(struct r8152 *tp)
>         INIT_LIST_HEAD(&tp->tx_free);
>         INIT_LIST_HEAD(&tp->rx_done);
>         skb_queue_head_init(&tp->tx_queue);
> -       skb_queue_head_init(&tp->rx_queue);
>         atomic_set(&tp->rx_count, 0);
>
>         for (i =3D 0; i < RTL8152_MAX_RX; i++) {
> @@ -2431,24 +2430,6 @@ static int rx_bottom(struct r8152 *tp, int budget)
>         int ret =3D 0, work_done =3D 0;
>         struct napi_struct *napi =3D &tp->napi;
>
> -       if (!skb_queue_empty(&tp->rx_queue)) {
> -               while (work_done < budget) {
> -                       struct sk_buff *skb =3D __skb_dequeue(&tp->rx_que=
ue);
> -                       struct net_device *netdev =3D tp->netdev;
> -                       struct net_device_stats *stats =3D &netdev->stats=
;
> -                       unsigned int pkt_len;
> -
> -                       if (!skb)
> -                               break;
> -
> -                       pkt_len =3D skb->len;
> -                       napi_gro_receive(napi, skb);
> -                       work_done++;
> -                       stats->rx_packets++;
> -                       stats->rx_bytes +=3D pkt_len;
> -               }
> -       }
> -
>         if (list_empty(&tp->rx_done))
>                 goto out1;
>
> @@ -2484,10 +2465,6 @@ static int rx_bottom(struct r8152 *tp, int budget)
>                         unsigned int pkt_len, rx_frag_head_sz;
>                         struct sk_buff *skb;
>
> -                       /* limit the skb numbers for rx_queue */
> -                       if (unlikely(skb_queue_len(&tp->rx_queue) >=3D 10=
00))
> -                               break;
> -
>                         pkt_len =3D le32_to_cpu(rx_desc->opts1) & RX_LEN_=
MASK;
>                         if (pkt_len < ETH_ZLEN)
>                                 break;
> @@ -2525,14 +2502,10 @@ static int rx_bottom(struct r8152 *tp, int budget=
)
>
>                         skb->protocol =3D eth_type_trans(skb, netdev);
>                         rtl_rx_vlan_tag(rx_desc, skb);
> -                       if (work_done < budget) {
> -                               work_done++;
> -                               stats->rx_packets++;
> -                               stats->rx_bytes +=3D skb->len;
> -                               napi_gro_receive(napi, skb);
> -                       } else {
> -                               __skb_queue_tail(&tp->rx_queue, skb);
> -                       }
> +                       work_done++;
> +                       stats->rx_packets++;
> +                       stats->rx_bytes +=3D skb->len;
> +                       napi_gro_receive(napi, skb);
>
>  find_next_rx:
>                         rx_data =3D rx_agg_align(rx_data + pkt_len + ETH_=
FCS_LEN);
> @@ -2562,16 +2535,24 @@ static int rx_bottom(struct r8152 *tp, int budget=
)
>                         urb->actual_length =3D 0;
>                         list_add_tail(&agg->list, next);
>                 }
> +
> +               /* Break if budget is exhausted. */

[1] More conventional way to to put this condition at the beginning of
the while () loop,
because the budget could be zero.

> +               if (work_done >=3D budget)
> +                       break;
>         }
>
> +       /* Splice the remained list back to rx_done */
>         if (!list_empty(&rx_queue)) {
>                 spin_lock_irqsave(&tp->rx_lock, flags);
> -               list_splice_tail(&rx_queue, &tp->rx_done);
> +               list_splice(&rx_queue, &tp->rx_done);
>                 spin_unlock_irqrestore(&tp->rx_lock, flags);
>         }
>
>  out1:
> -       return work_done;
> +       if (work_done > budget)

This (work_done >budget) condition would never be true if point [1] is
addressed.

> +               return budget;
> +       else
> +               return work_done;
>  }
>
>  static void tx_bottom(struct r8152 *tp)
> @@ -2992,9 +2973,6 @@ static int rtl_stop_rx(struct r8152 *tp)
>         list_splice(&tmp_list, &tp->rx_info);
>         spin_unlock_irqrestore(&tp->rx_lock, flags);
>
> -       while (!skb_queue_empty(&tp->rx_queue))
> -               dev_kfree_skb(__skb_dequeue(&tp->rx_queue));
> -
>         return 0;
>  }
>
> --
> 2.41.0
>

