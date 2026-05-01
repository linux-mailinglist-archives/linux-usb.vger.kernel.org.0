Return-Path: <linux-usb+bounces-36814-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPIrEt5Y9GkvAwIAu9opvQ
	(envelope-from <linux-usb+bounces-36814-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 09:40:14 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 501404AB002
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 09:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A08283007A59
	for <lists+linux-usb@lfdr.de>; Fri,  1 May 2026 07:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7C136C9F0;
	Fri,  1 May 2026 07:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GEJ5aEQO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CB9363093
	for <linux-usb@vger.kernel.org>; Fri,  1 May 2026 07:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777621186; cv=pass; b=iiJjMFoZ4Z6KQNelM8bZQCZPwk0o07QY1Ws0V+GkQQ0O2jQs8MNUZPuKril5gZe7B9fHYlS7wctG4c8yh4QfowXd/iHikgsXF6vqLp7mou7zZ796UawSv+KJ4rLZ2OAJq4wfDdkYqXy/1C2jTE0Mb18h6adQXq1CVeF6gw+KkqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777621186; c=relaxed/simple;
	bh=TbLaoWYohHPqj/XG/w1dzsXdf6YqFfSZc9edl1STeRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AlddusP61vLU7HplXbji44ZBil1O2sIKkJ2F1CvYDPjAXp2scSWOu5/ZLaV21TjkwsMG//ObcB7YQR922zl4wPd9v6u2MG5xmGEtQwQV+ufIElK21TR4QcUsgd1EXZUe/k76TGKRixXEcQ1QAFMmXlgmMUIbIJah0gNhYQ4SrQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GEJ5aEQO; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38e7c3a2deaso16027071fa.2
        for <linux-usb@vger.kernel.org>; Fri, 01 May 2026 00:39:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777621182; cv=none;
        d=google.com; s=arc-20240605;
        b=Pxp4JYyw4cJAleiXGnmMEi9PQkGosoJds6EqHvVPMLEduMURAvq3Y82B9NMYJZ64rV
         vCqjwiEuL1R2bAWRjKwXAiF1RRSpr4jJMUkTazOCQVuuCrFB79/0wJ8aIiXg2iW1fGCA
         D/mjyZ1083RUS2D11KrB5s4DFlnRyS19ND5gJNuCcNuKk2ykt8M0oK6QITPAWYR0CA5n
         +UT0PWnnZXXbEEmtqj34qF8EozHJPWrgpWA/7UH1iWUby7/3l9Nk/Nm6j1EYjqxy2VMS
         WYOpucR4E+cva3HBVUJ0aPVUt5hCgcqCia/M8zO15CmkClgSPeLM0x5wTEBBbYEHbJ+/
         ZewA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=N5yIG/VNV+70xFszkANHVR8rh10LtJp9VdT7AZQOrpQ=;
        fh=rL6E8poSdqET8oxHQ4c+o8KXs70vlkp3um9je/6Yyes=;
        b=R3QAXd0Rf9ivB8JBEeDwt0QMc/FZECb4GzPXX5TFTFyucyt/mW4qZPMx0N3r2TJ5NW
         YiqwzaYVXvl/ADjw+uFAmqLt+grXbzqU6NhTPFtzUtINlpZwL73GmDmfGhtO39cQspZX
         NtQtyN1Paea+8aHhtTyPIMb6f+QYXB1sNV3555WEuU9gO1xm4Slvi2XmrAjZeTaeqeNL
         Cq78k3eYFLpYsHdbwJ/XgtPkOii40DwhQiXd+kohCT94goEhY82/MkELCLWR7k+q7DGe
         fQGUzKvKFqT0X93FjxFHQmBIQcEytceQFFtuFSRGThRVSry52gghLatCnG8JA1Hl52nz
         BMJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777621182; x=1778225982; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N5yIG/VNV+70xFszkANHVR8rh10LtJp9VdT7AZQOrpQ=;
        b=GEJ5aEQOu5JLBc6QAEWPXNoNw5rmPtGCkkwJVDi/4RVZt6sP6NLm0N1Lb2skecFh1G
         L/rEjbj4kT6EpiQjScndF2ADL8GtmfTPVyJjRNj7BchFBe/LNOnOOjsFfv2sEyzNItz3
         YcSaTJAZSuRs1tR0HNPvdQsXclUK07kLBy97rFTq8tsydXZzpk4HZ3kNVo1/sXrPXk6o
         b56vqWt8Zq267NZrYGdU8K1sKJ/AS7E8XFXo0i6p0YbFri7CyTs11oATh3kcAJoWbcHj
         mfl6nOFQrX7qXQvFdUF+AjF+6AOrga66G5QTACPftbBl1PER3WU09VQUXP83j46+7eaz
         8wgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777621182; x=1778225982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5yIG/VNV+70xFszkANHVR8rh10LtJp9VdT7AZQOrpQ=;
        b=WbM7uBSF3dkFj4OXiesM8NsiHh2dnLakHFW5Shotj+iMe3PbaLACL4n1UHp3pr6w/e
         MiL6l8gjIiWf++Zzsjf/pKIMyMhLtGnXaHlQHaL0TSEMpPGu5JNCi8pSDg2jafMbjf8+
         yuFnU50PgFmHine8L7pj/b/MOihAy39X/JtB+cQGG49PSl8Q+2q9bDLuNqaRGtyEBVuy
         eN0H5TG548XtC7M9Ac9eEXp45L80Zq9CY6hbktUqLHKfY4bsgCHJU3xYQjgHAtMoKt4K
         ViKZaJG+wHS2MlM5zEhL6BBpY1aALiIRj4VzPylnw/wOv1nxCsXoG9GuNsNQSkz1P/mB
         L7Pw==
X-Forwarded-Encrypted: i=1; AFNElJ+mi5O0oIJNJZxiRWzFWiu9CD14UiWFVk2+FCykb5mHaqu2LhNi5FqEJAOinD1QQifSm21KQ4LFM3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGknuybLrd933iD12hfJr8qxcb0gOdxpLGO0GIOoe7Nw/2WxDn
	GMITCUQq1xpvDOKbMfyG4j8Uk3y9vDY1zWoQXSQ27pd73TV6Ug70XHisX9EHsN+oOPSsOcrCWmI
	KIRF3BvYLUju/EgdlRrPKRaDe4BP35VquUafCbA9g
X-Gm-Gg: AeBDieuBMukLjFo02lmkzBxsV7PHgG3pEPmQ39jU7TCmH97GGn1ag1avYwrVZ3z3mz5
	Vg1ln4eFkyxFfWDrzn2q2kRKlrImmyCpt6fi3NG8E/BU6wd0yQszIlWr+GF95x0kKVy+89QWcOV
	bymfAn5uSkDljwjlFxXXC20k92VZX4g8qtbsHbPKSqzC6aWgDVtuTFETd8XemDntdfO6BU0aK1A
	6jR4BqLCsFjhy0wIFau7LAE/4vDXicTlwJaOaDNGCBrVUZITYxfKAs2tStEb5ZpcAoZ9BebFsOv
	j6001O7f+sZi4Mos5mAo9HUqqp+NF1enYcW/e4Oqy9ou1sYApwBK6zUGuG3x9j8A1jPd6AZ4DJg
	wp7LqbI78JVnj9i+mxg==
X-Received: by 2002:a05:651c:2114:b0:38e:186e:350e with SMTP id
 38308e7fff4ca-3934dec7039mr26121991fa.7.1777621181309; Fri, 01 May 2026
 00:39:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-kcov-refactor-common-handle-v1-1-23a0c7a0ba38@google.com>
In-Reply-To: <20260430-kcov-refactor-common-handle-v1-1-23a0c7a0ba38@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 1 May 2026 09:39:30 +0200
X-Gm-Features: AVHnY4LuOCyhbkG_hl8Sa5NNYS1SbIPwYG33VO-fKmuVe5zr0rpNYf2arYcAEvU
Message-ID: <CACT4Y+ZMJs0-9N+tcAa7Yi9-r5wshy0BAD1cdYRxBBPvOtMpZQ@mail.gmail.com>
Subject: Re: [PATCH] kcov: refactor common handle ID into kcov_common_handle_id
To: Jann Horn <jannh@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, kasan-dev@googlegroups.com, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Potapenko <glider@google.com>, 
	Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 501404AB002
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36814-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[gmail.com,googlegroups.com,linux-foundation.org,google.com,kernel.org,linuxfoundation.org,zenithal.me,vger.kernel.org,redhat.com,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dvyukov@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Thu, 30 Apr 2026 at 16:15, Jann Horn <jannh@google.com> wrote:
>
> Store common handle IDs in "struct kcov_common_handle_id", which consumes
> no space in non-KCOV builds.
> This cleanup removes #ifdef boilerplate code from subsystems that
> integrate with KCOV (in particular in usbip_common.h and skbuff.h, see the
> diffstat).
> This should also make it easier to add KCOV remote coverage to more
> subsystems in the future.
>
> Signed-off-by: Jann Horn <jannh@google.com>

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

Thanks!

> ---
>  drivers/usb/usbip/usbip_common.h | 29 +----------------------------
>  drivers/usb/usbip/vhci_rx.c      |  4 ++--
>  drivers/usb/usbip/vhci_sysfs.c   |  2 +-
>  drivers/vhost/vhost.h            |  2 +-
>  include/linux/kcov.h             | 12 ++++++------
>  include/linux/skbuff.h           | 14 +++-----------
>  include/linux/types.h            |  6 ++++++
>  kernel/kcov.c                    |  6 +++---
>  8 files changed, 23 insertions(+), 52 deletions(-)
>
> diff --git a/drivers/usb/usbip/usbip_common.h b/drivers/usb/usbip/usbip_common.h
> index 282efca64a01..be4c5e65a7f8 100644
> --- a/drivers/usb/usbip/usbip_common.h
> +++ b/drivers/usb/usbip/usbip_common.h
> @@ -282,9 +282,7 @@ struct usbip_device {
>                 void (*unusable)(struct usbip_device *);
>         } eh_ops;
>
> -#ifdef CONFIG_KCOV
> -       u64 kcov_handle;
> -#endif
> +       struct kcov_common_handle_id kcov_handle;
>  };
>
>  #define kthread_get_run(threadfn, data, namefmt, ...)                     \
> @@ -339,29 +337,4 @@ static inline int interface_to_devnum(struct usb_interface *interface)
>         return udev->devnum;
>  }
>
> -#ifdef CONFIG_KCOV
> -
> -static inline void usbip_kcov_handle_init(struct usbip_device *ud)
> -{
> -       ud->kcov_handle = kcov_common_handle();
> -}
> -
> -static inline void usbip_kcov_remote_start(struct usbip_device *ud)
> -{
> -       kcov_remote_start_common(ud->kcov_handle);
> -}
> -
> -static inline void usbip_kcov_remote_stop(void)
> -{
> -       kcov_remote_stop();
> -}
> -
> -#else /* CONFIG_KCOV */
> -
> -static inline void usbip_kcov_handle_init(struct usbip_device *ud) { }
> -static inline void usbip_kcov_remote_start(struct usbip_device *ud) { }
> -static inline void usbip_kcov_remote_stop(void) { }
> -
> -#endif /* CONFIG_KCOV */
> -
>  #endif /* __USBIP_COMMON_H */
> diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
> index a75f4a898a41..a678e7c89837 100644
> --- a/drivers/usb/usbip/vhci_rx.c
> +++ b/drivers/usb/usbip/vhci_rx.c
> @@ -261,9 +261,9 @@ int vhci_rx_loop(void *data)
>                 if (usbip_event_happened(ud))
>                         break;
>
> -               usbip_kcov_remote_start(ud);
> +               kcov_remote_start_common(ud->kcov_handle);
>                 vhci_rx_pdu(ud);
> -               usbip_kcov_remote_stop();
> +               kcov_remote_stop();
>         }
>
>         return 0;
> diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
> index 5bc8c47788d4..b98d14c43d13 100644
> --- a/drivers/usb/usbip/vhci_sysfs.c
> +++ b/drivers/usb/usbip/vhci_sysfs.c
> @@ -425,7 +425,7 @@ static ssize_t attach_store(struct device *dev, struct device_attribute *attr,
>         vdev->ud.tcp_rx     = tcp_rx;
>         vdev->ud.tcp_tx     = tcp_tx;
>         vdev->ud.status     = VDEV_ST_NOTASSIGNED;
> -       usbip_kcov_handle_init(&vdev->ud);
> +       vdev->ud.kcov_handle = kcov_common_handle();
>
>         spin_unlock(&vdev->ud.lock);
>         spin_unlock_irqrestore(&vhci->lock, flags);
> diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
> index 4fe99765c5c7..0192ade6e749 100644
> --- a/drivers/vhost/vhost.h
> +++ b/drivers/vhost/vhost.h
> @@ -44,7 +44,7 @@ struct vhost_worker {
>         /* Used to serialize device wide flushing with worker swapping. */
>         struct mutex            mutex;
>         struct llist_head       work_list;
> -       u64                     kcov_handle;
> +       struct kcov_common_handle_id kcov_handle;
>         u32                     id;
>         int                     attachment_cnt;
>         bool                    killed;
> diff --git a/include/linux/kcov.h b/include/linux/kcov.h
> index 0143358874b0..cdb72b3859d8 100644
> --- a/include/linux/kcov.h
> +++ b/include/linux/kcov.h
> @@ -43,11 +43,11 @@ do {                                                \
>  /* See Documentation/dev-tools/kcov.rst for usage details. */
>  void kcov_remote_start(u64 handle);
>  void kcov_remote_stop(void);
> -u64 kcov_common_handle(void);
> +struct kcov_common_handle_id kcov_common_handle(void);
>
> -static inline void kcov_remote_start_common(u64 id)
> +static inline void kcov_remote_start_common(struct kcov_common_handle_id id)
>  {
> -       kcov_remote_start(kcov_remote_handle(KCOV_SUBSYSTEM_COMMON, id));
> +       kcov_remote_start(kcov_remote_handle(KCOV_SUBSYSTEM_COMMON, id.val));
>  }
>
>  static inline void kcov_remote_start_usb(u64 id)
> @@ -99,11 +99,11 @@ static inline void kcov_prepare_switch(struct task_struct *t) {}
>  static inline void kcov_finish_switch(struct task_struct *t) {}
>  static inline void kcov_remote_start(u64 handle) {}
>  static inline void kcov_remote_stop(void) {}
> -static inline u64 kcov_common_handle(void)
> +static inline struct kcov_common_handle_id kcov_common_handle(void)
>  {
> -       return 0;
> +       return (struct kcov_common_handle_id){};
>  }
> -static inline void kcov_remote_start_common(u64 id) {}
> +static inline void kcov_remote_start_common(struct kcov_common_handle_id id) {}
>  static inline void kcov_remote_start_usb(u64 id) {}
>  static inline void kcov_remote_start_usb_softirq(u64 id) {}
>  static inline void kcov_remote_stop_softirq(void) {}
> diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> index 2bcf78a4de7b..a3fe418f7ced 100644
> --- a/include/linux/skbuff.h
> +++ b/include/linux/skbuff.h
> @@ -1082,9 +1082,7 @@ struct sk_buff {
>         __u16                   network_header;
>         __u16                   mac_header;
>
> -#ifdef CONFIG_KCOV
> -       u64                     kcov_handle;
> -#endif
> +       struct kcov_common_handle_id kcov_handle;
>
>         ); /* end headers group */
>
> @@ -5437,20 +5435,14 @@ static inline void skb_reset_csum_not_inet(struct sk_buff *skb)
>  }
>
>  static inline void skb_set_kcov_handle(struct sk_buff *skb,
> -                                      const u64 kcov_handle)
> +                                      struct kcov_common_handle_id kcov_handle)
>  {
> -#ifdef CONFIG_KCOV
>         skb->kcov_handle = kcov_handle;
> -#endif
>  }
>
> -static inline u64 skb_get_kcov_handle(struct sk_buff *skb)
> +static inline struct kcov_common_handle_id skb_get_kcov_handle(struct sk_buff *skb)
>  {
> -#ifdef CONFIG_KCOV
>         return skb->kcov_handle;
> -#else
> -       return 0;
> -#endif
>  }
>
>  static inline void skb_mark_for_recycle(struct sk_buff *skb)
> diff --git a/include/linux/types.h b/include/linux/types.h
> index 608050dbca6a..93166b0b0617 100644
> --- a/include/linux/types.h
> +++ b/include/linux/types.h
> @@ -224,6 +224,12 @@ struct ustat {
>         char                    f_fpack[6];
>  };
>
> +struct kcov_common_handle_id {
> +#ifdef CONFIG_KCOV
> +       u64 val;
> +#endif
> +};
> +
>  /**
>   * struct callback_head - callback structure for use with RCU and task_work
>   * @next: next update requests in a list
> diff --git a/kernel/kcov.c b/kernel/kcov.c
> index 0b369e88c7c9..a43e33a28adb 100644
> --- a/kernel/kcov.c
> +++ b/kernel/kcov.c
> @@ -1083,11 +1083,11 @@ void kcov_remote_stop(void)
>  EXPORT_SYMBOL(kcov_remote_stop);
>
>  /* See the comment before kcov_remote_start() for usage details. */
> -u64 kcov_common_handle(void)
> +struct kcov_common_handle_id kcov_common_handle(void)
>  {
>         if (!in_task())
> -               return 0;
> -       return current->kcov_handle;
> +               return (struct kcov_common_handle_id){ .val = 0 };
> +       return (struct kcov_common_handle_id){ .val = current->kcov_handle };
>  }
>  EXPORT_SYMBOL(kcov_common_handle);
>
>
> ---
> base-commit: 57b8e2d666a31fa201432d58f5fe3469a0dd83ba
> change-id: 20260430-kcov-refactor-common-handle-25178495b2eb
>
> --
> Jann Horn <jannh@google.com>
>

