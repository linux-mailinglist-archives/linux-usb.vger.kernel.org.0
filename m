Return-Path: <linux-usb+bounces-30089-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8F1C35C3F
	for <lists+linux-usb@lfdr.de>; Wed, 05 Nov 2025 14:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BF88D4FDCDE
	for <lists+linux-usb@lfdr.de>; Wed,  5 Nov 2025 13:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC423317712;
	Wed,  5 Nov 2025 13:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RDq33sq9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A493168FD
	for <linux-usb@vger.kernel.org>; Wed,  5 Nov 2025 13:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762347916; cv=none; b=Q5Tq+BiIuqGnCXUYcB7lNorL6bAIYZJ9QNaUMR+Coyoc8vIl1OIYsPvQVH0yWgYJVfNcobBaEgkgHNnGg+VRrBNoYnlBYsFkUVJrVRBEByo6jJgYi1jRLsrdPDVINKUxqR5I0buVci2qMHBFgkv6B+smuRvGpopgy+PDPoLRJ3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762347916; c=relaxed/simple;
	bh=agSHEtZvPJYRIhsGzNZVezqkVYPi3pBx4ZEoqYs0PkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m4fUjAtMejaRknYGd9vfIge1Te6ydleukuBaoUmEcVJ7RKF3nkIDqlN8sizHMUoc4eLa92Gyhq/kbO25iFEMYOX4T+WTRdgFogb9X2RJso+if7tGoyUxcCUPjMoUgtXQb7so1E7gnzM1N70vALcwpAZY0uF8QG17jsKHrjl1fww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RDq33sq9; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ed7a7ddc27so3142881cf.2
        for <linux-usb@vger.kernel.org>; Wed, 05 Nov 2025 05:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762347913; x=1762952713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7x+B9bPBixdtyVtYVHkU2x+LhEirUQEYUDWiZN/fOQ=;
        b=RDq33sq9KXEiVHpcQpNfPlXv3UL8+tFVIRa2pW9YySRry32oAT+j4R8gIfk+CuBpGV
         CmT140c/S9tjeB4s2ayQJmAUzHPjfgdPITmEXe2VFysxJsWWu4f7CVIvoWUh7uAMVGyV
         pWMoFWV2VTmxXC/s1hifhdQEXKDtxtS6iu0TFRMiFOwfrj5z9IrCQkcRrkwl3Hri98g+
         bIc9G/zXTAEADW9uN2wuQEA85LrAaaNq88iVdxW8LTNStWiMMaxkO3pCAtNiWkiu+AZE
         eo/AfX8KUm5YxkyRl7KQsr2lKoG5Jre8IndnK9/x0AOQiHmCob4OrPtcHvcTk6X8+UCg
         DTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762347913; x=1762952713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7x+B9bPBixdtyVtYVHkU2x+LhEirUQEYUDWiZN/fOQ=;
        b=gnJArlSOXVaV4cgXhNKlS/ZGMIscafKAgYbJgj1WuthX1FEPNSCozVI0X7X15KN7cq
         c65s+CyOGImAu9e5/y5UvoHYy11qd0IRc42d9FonUG5L3leq4C85Wd6S8RAiISn/bBXK
         z+O0ySoE4hb7pYgrY8TlX3i1G6arKYvt+8D4l9ic46yWauShcPVT8bDUDl6mZv86DBxW
         zp7HAB4Wded4GXFQUchme2UT0ot5B2WVUXDy5U75ptdUfBKuEUFaC/pvATKNIP5fJjxz
         JRq/sBKnameTbY7PGhDqzzWCF3TqwvHJTuOEqRH2yflaVIX6ouo0nu1tWSwOt9uqYjGq
         WsrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPIDcWqu0NM5yKYrr8JE9M0eQe6JZl6nRh6aMjCxABbkvhoSqeyid4ZnDgCQ9lGO6CR5pr12GBDx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YylChmc2a7aUb3vPlOBiwkHYZ9jHwIBHydAqQxnFMA67faIQPJf
	DHSmCK5P0+RgkWwXvf37TEA4jN/arXNOzUTKfo3f1r5oOHnTJz2CuicRr7zCyIFNy/RlhO1w0kK
	Tgt3/565eXspS7Ix7YExgMrzsdi203XLLrNi2WV7i
X-Gm-Gg: ASbGncuFSZsrH+dcOP/pHlAjEv30sQ5f0TtEayu7taQk4uV3lQZ28bcMvD/wVVbQ7v+
	AOkgxZ4pHZAjbBDpFCPesZ22Yb+TjQpJvw8BT12uIllQqND0TtJZxDHndMBIEQL0AMCHUttvmHF
	vJ9WMFtTWFOtF0Nxdnid+hgibnkdLaBmPmf2t5349l6aiUcnOjRvZ7kBL/FpwLuci/Cx3efc8qw
	her4kzpwcDeAobIWow+tbX4Gc5xSAKDwI495edJCAnPzR3HsVmiQMoZVwUA
X-Google-Smtp-Source: AGHT+IEY+GzhSiC4kXGw1rdG3sCGpAGWlOwwjtVH4BSSwgpEY7LedrZO7sBJfomJsnspnYboqF1KcHs1fP6gBb6TJDU=
X-Received: by 2002:a05:622a:260e:b0:4ec:f86f:9244 with SMTP id
 d75a77b69052e-4ed7236b82emr45476671cf.34.1762347912869; Wed, 05 Nov 2025
 05:05:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251104161327.41004-1-simon.schippers@tu-dortmund.de>
 <20251104161327.41004-2-simon.schippers@tu-dortmund.de> <CANn89iL6MjvOc8qEQpeQJPLX0Y3X0HmqNcmgHL4RzfcijPim5w@mail.gmail.com>
 <66d22955-bb20-44cf-8ad3-743ae272fec7@tu-dortmund.de> <CANn89i+oGnt=Gpo1hZh+8uaEoK3mKLQY-gszzHWC+A2enXa7Tw@mail.gmail.com>
 <be77736d-6fde-4f48-b774-f7067a826656@tu-dortmund.de> <CANn89iJVW-_qLbUehhJNJO70PRuw1SZVQX0towgZ4K-JvsPKkw@mail.gmail.com>
 <c01c12a8-c19c-4b9f-94d1-2a106e65a074@tu-dortmund.de>
In-Reply-To: <c01c12a8-c19c-4b9f-94d1-2a106e65a074@tu-dortmund.de>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 5 Nov 2025 05:05:01 -0800
X-Gm-Features: AWmQ_bmczxTD_xiVfmpYzU_nFYc93glUn-Npyv14kOLlWnq67dCdCSeUuf657bM
Message-ID: <CANn89iJpXwmvg0MOvLo8+hVAhaMTL_1_62Afk_6dG1ZEL3tORQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 1/1] usbnet: Add support for Byte Queue Limits (BQL)
To: Simon Schippers <simon.schippers@tu-dortmund.de>
Cc: oneukum@suse.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 4:58=E2=80=AFAM Simon Schippers
<simon.schippers@tu-dortmund.de> wrote:
>
> On 11/5/25 13:34, Eric Dumazet wrote:
> > On Wed, Nov 5, 2025 at 4:20=E2=80=AFAM Simon Schippers
> > <simon.schippers@tu-dortmund.de> wrote:
> >>
> >> On 11/5/25 12:28, Eric Dumazet wrote:
> >>> On Wed, Nov 5, 2025 at 2:35=E2=80=AFAM Simon Schippers
> >>> <simon.schippers@tu-dortmund.de> wrote:
> >>>>
> >>>> On 11/4/25 18:00, Eric Dumazet wrote:
> >>>>> On Tue, Nov 4, 2025 at 8:14=E2=80=AFAM Simon Schippers
> >>>>> <simon.schippers@tu-dortmund.de> wrote:
> >>>>>>
> >>>>>> The usbnet driver currently relies on fixed transmit queue lengths=
, which
> >>>>>> can lead to bufferbloat and large latency spikes under load -
> >>>>>> particularly with cellular modems.
> >>>>>> This patch adds support for Byte Queue Limits (BQL) to dynamically=
 manage
> >>>>>> the transmit queue size and reduce latency without sacrificing
> >>>>>> throughput.
> >>>>>>
> >>>>>> Testing was performed on various devices using the usbnet driver f=
or
> >>>>>> packet transmission:
> >>>>>>
> >>>>>> - DELOCK 66045: USB3 to 2.5 GbE adapter (ax88179_178a)
> >>>>>> - DELOCK 61969: USB2 to 1 GbE adapter (asix)
> >>>>>> - Quectel RM520: 5G modem (qmi_wwan)
> >>>>>> - USB2 Android tethering (cdc_ncm)
> >>>>>>
> >>>>>> No performance degradation was observed for iperf3 TCP or UDP traf=
fic,
> >>>>>> while latency for a prioritized ping application was significantly
> >>>>>> reduced. For example, using the USB3 to 2.5 GbE adapter, which was=
 fully
> >>>>>> utilized by iperf3 UDP traffic, the prioritized ping was improved =
from
> >>>>>> 1.6 ms to 0.6 ms. With the same setup but with a 100 Mbit/s Ethern=
et
> >>>>>> connection, the prioritized ping was improved from 35 ms to 5 ms.
> >>>>>>
> >>>>>> Signed-off-by: Simon Schippers <simon.schippers@tu-dortmund.de>
> >>>>>> ---
> >>>>>>  drivers/net/usb/usbnet.c | 8 ++++++++
> >>>>>>  1 file changed, 8 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
> >>>>>> index 62a85dbad31a..1994f03a78ad 100644
> >>>>>> --- a/drivers/net/usb/usbnet.c
> >>>>>> +++ b/drivers/net/usb/usbnet.c
> >>>>>> @@ -831,6 +831,7 @@ int usbnet_stop(struct net_device *net)
> >>>>>>
> >>>>>>         clear_bit(EVENT_DEV_OPEN, &dev->flags);
> >>>>>>         netif_stop_queue (net);
> >>>>>> +       netdev_reset_queue(net);
> >>>>>>
> >>>>>>         netif_info(dev, ifdown, dev->net,
> >>>>>>                    "stop stats: rx/tx %lu/%lu, errs %lu/%lu\n",
> >>>>>> @@ -939,6 +940,7 @@ int usbnet_open(struct net_device *net)
> >>>>>>         }
> >>>>>>
> >>>>>>         set_bit(EVENT_DEV_OPEN, &dev->flags);
> >>>>>> +       netdev_reset_queue(net);
> >>>>>>         netif_start_queue (net);
> >>>>>>         netif_info(dev, ifup, dev->net,
> >>>>>>                    "open: enable queueing (rx %d, tx %d) mtu %d %s=
 framing\n",
> >>>>>> @@ -1500,6 +1502,7 @@ netdev_tx_t usbnet_start_xmit(struct sk_buff=
 *skb, struct net_device *net)
> >>>>>>         case 0:
> >>>>>>                 netif_trans_update(net);
> >>>>>>                 __usbnet_queue_skb(&dev->txq, skb, tx_start);
> >>>>>> +               netdev_sent_queue(net, skb->len);
> >>>>>>                 if (dev->txq.qlen >=3D TX_QLEN (dev))
> >>>>>>                         netif_stop_queue (net);
> >>>>>>         }
> >>>>>> @@ -1563,6 +1566,7 @@ static inline void usb_free_skb(struct sk_bu=
ff *skb)
> >>>>>>  static void usbnet_bh(struct timer_list *t)
> >>>>>>  {
> >>>>>>         struct usbnet           *dev =3D timer_container_of(dev, t=
, delay);
> >>>>>> +       unsigned int bytes_compl =3D 0, pkts_compl =3D 0;
> >>>>>>         struct sk_buff          *skb;
> >>>>>>         struct skb_data         *entry;
> >>>>>>
> >>>>>> @@ -1574,6 +1578,8 @@ static void usbnet_bh(struct timer_list *t)
> >>>>>>                                 usb_free_skb(skb);
> >>>>>>                         continue;
> >>>>>>                 case tx_done:
> >>>>>> +                       bytes_compl +=3D skb->len;
> >>>>>> +                       pkts_compl++;
> >>>>>>                         kfree(entry->urb->sg);
> >>>>>>                         fallthrough;
> >>>>>>                 case rx_cleanup:
> >>>>>> @@ -1584,6 +1590,8 @@ static void usbnet_bh(struct timer_list *t)
> >>>>>>                 }
> >>>>>>         }
> >>>>>>
> >>>>>> +       netdev_completed_queue(dev->net, pkts_compl, bytes_compl);
> >>>>>> +
> >>>>>>         /* restart RX again after disabling due to high error rate=
 */
> >>>>>>         clear_bit(EVENT_RX_KILL, &dev->flags);
> >>>>>>
> >>>>>
> >>>>> I think this is racy. usbnet_bh() can run from two different contex=
ts,
> >>>>> at the same time (from two cpus)
> >>>>>
> >>>>> 1) From process context :
> >>>>> usbnet_bh_work()
> >>>>>
> >>>>> 2) From a timer. (dev->delay)
> >>>>>
> >>>>>
> >>>>> To use BQL, you will need to add mutual exclusion.
> >>>>
> >>>> Yeah, I missed that.
> >>>>
> >>>> I guess synchronizing with the lock of the sk_buff_head dev->done ma=
kes
> >>>> sense? The same locking is also done right before in skb_dequeue.
> >>>
> >>> Or only protect the netdev_completed_queue(dev->net, pkts_compl,
> >>> bytes_compl) call,
> >>> adding a specific/dedicated spinlock for this purpose.
> >>>
> >>> spin_lock_bh(&dev->bql_spinlock);
> >>> netdev_completed_queue(dev->net, pkts_compl, bytes_compl);
> >>> spin_unlock_bh(&dev->bql_spinlock);
> >>>
> >>> I am assuming no usbnet driver is setting dev->lltx =3D true (or plan=
 to
> >>> in the future)
> >>> so usbnet_start_xmit() is protected by HARD_TX_LOCK() already.
> >>
> >> Yes, I also want to only protect the netdev_completed_queue(dev->net,
> >> pkts_compl, bytes_compl) call. However, I am wondering what you mean w=
ith
> >>
> >> spin_lock_bh(&dev->bql_spinlock)
> >> ...
> >>
> >>
> >> Do we want to protect against usbnet_start_xmit()? Maybe I am missing
> >> something, but other BQL implementations also do not seem to protect
> >> against their respective ndo_start_xmit.
> >
> > BQL has been designed so that producer/consumer can run in //
> >
> > However, all producers need exclusion (typically done with HARD_TX_LOCK=
)
> > All consumers need exclusion (typically done because of NAPI sched bit)
> >
> >>
> >>
> >> My approach would just protect against usbnet_bh calls from another
> >> context with the same locking as skb_dequeue():
> >>
> >> spin_lock_irqsave(&list->lock, flags);
> >> netdev_completed_queue(dev->net, pkts_compl, bytes_compl);
> >> spin_unlock_irqrestore(&list->lock, flags);
> >
> > I tend to prefer not masking hard irq unless really necessary.
> >
> > Also, reusing  a lock for different purposes makes things confusing
> > in terms of code maintenance.
> >
> > usbnet is hardly performance critical, I would keep list->lock only to
> > protect the list of skbs :)
>
> Thanks for the clarification!
>
>
> So in usbnet.h I will just
>
> #include <linux/spinlock.h>
>
> and then save the new field
>
> spinlock_t bql_spinlock;
>
> in struct usbnet and will then call
>
> spin_lock_bh(&dev->bql_spinlock);
> netdev_completed_queue(dev->net, pkts_compl, bytes_compl);
> spin_unlock_bh(&dev->bql_spinlock);
>
> in usbnet_bh. Am I right?

You also need to spin_lock_init() this new lock in setup phase (usbnet_prob=
e)

Test/Run your code after enabling LOCKDEP in your .config
(CONFIG_PROVE_LOCKING=3Dy)

