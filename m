Return-Path: <linux-usb+bounces-14178-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6DE960C0C
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 15:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB0221F25DC1
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 13:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A041BDA8B;
	Tue, 27 Aug 2024 13:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IXYikWRs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CFA19DFB6
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 13:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724765414; cv=none; b=pbLT1cCK72T9Ta4fAPJEGNxBIMXlI5L9kaHe8Au/N+vzXY6IW8eRPh2HVVdm1mxN5Tsm1egpSE1FQjv7DmSLcNsV4VIKIag7EbhErdR7JAcCU+boorEPkKsaUGio1LlkynEJ8weCNPwb/gBRmFIAyARDL4alr/aHxPJ6CLqALNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724765414; c=relaxed/simple;
	bh=DhIO7DPkbNyeSN9NOmSnyNwEbElKepwm7ijxsDftptE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=i0F1W48Bx1V1KtLdfTN6beH5rWMCBw+s31Mj9weMY+DPcAEVK6Y0ntE5K1sLmE96eEK+XDt4boV7hBZRC/UHBB1ployN82lDyVPGlgC8F2IFE0eGN89hKeRsdESg+QUMl7nLCG+0Fv26r3H7xu8nN73KGl9d2YIfxpah6D2Lm0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IXYikWRs; arc=none smtp.client-ip=209.85.167.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f68.google.com with SMTP id 2adb3069b0e04-53349d3071eso6683719e87.2
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 06:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724765409; x=1725370209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ndD4WXhurgaV6bF48gWPD1h7JA1gi9aWWHUX8inpgbE=;
        b=IXYikWRsXVbPWJLkKlNggi2lC9ldg6kqlOBHBwMYeloMxPZIFyp0EXYiE2VmyvwoCJ
         Q8SSF9F/KTQu6QaKzpsObb0E8Fr5ZH3duIiR83nm/gfXJa1PnNbgWdEUEUPjYr8KLmkV
         0JnKONw/Zxr3tk9bVhvcKmTap5+rmu9SZMLCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724765409; x=1725370209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndD4WXhurgaV6bF48gWPD1h7JA1gi9aWWHUX8inpgbE=;
        b=ALhnHnPkIAjey/EQ/k/FbFK5zB3xTQoB5Mf3cGKzShjzkY416AflmyjzNFJ9bmbPFR
         VEWsgEN0MWpOijtFc7nihq6OuQoAXECyQCBGZr5EWa2dsJWq3+g/r+ztyELghBVqaqwb
         wns0V495naI+u8U/OxPVrHIQy1NrI4ZaDVJa5TkeTAFNK4GOevcP1TrkCuC3nhZQKgwZ
         w5HnL+NBjBbf8WPUgtjUoapoc1oAAesbyIvusjNqhiAwlKzo1uFf9mIyfDy1wFHrjc6s
         9gDB68wfkgXTm7/KKs3yVYSDcORhdP5cOqspRjh3kgbXrwrazgnwGHIWegByNPOia+AV
         KvcQ==
X-Gm-Message-State: AOJu0YzFkRv4gflK6zHfNb10u9zZkakSUNYklqoLbQsq5BXUeAWWCbZy
	XMHJ28q4g89LyY5CShgJ0sw482c6ZgRP7bclwhmjHwcbN5q+YqmjGUvcGcF8F2MTS+/ecoKuwqU
	/+RMuRlZozLwPbfiUp0+oFg3mp9ttJ63TGu4=
X-Google-Smtp-Source: AGHT+IHe8L3rlsDw0U5I2I9atXtYua2P+UuU5MfJfF51rN0Uzjg778c3VW6i3uiR7LVLET/gxu0hbSSuq5j/a3aqf4g=
X-Received: by 2002:a05:6512:1395:b0:52c:e012:efad with SMTP id
 2adb3069b0e04-53438762c5cmr9273513e87.12.1724765408673; Tue, 27 Aug 2024
 06:30:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Tue, 27 Aug 2024 15:29:57 +0200
Message-ID: <CALwA+NbmKj_Wa2up2uDrQ=eoLcA4U3G37AvUguyY2K1JLLPdEw@mail.gmail.com>
Subject: Re: [RFT PATCH] xhci: dbc: Fix STALL transfer event handling
To: Mathias Nyman <mathias.nyman@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lu Baolu <baolu.lu@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 8/22/24 15:02, Mathias Nyman wrote:
> Don't flush all pending DbC data requests when an endpoint halts.
>
> An endpoint may halt and xHC DbC trigger a STALL error event if there's a=
n

trigger -> triggers

> issue with a bulk data transfer. The transfer should restart once xHC DbC
> receives a ClearFeature(ENDPOINT_HALT) request from the host.
>
> Once xHC DbC restarts it will start from the TRB pointed to by dequeue
> field in the endpoint context, which might be the same TRB we got the
> STALL event for. Turn the TRB to a no-op in this case to make sure xHC
> DbC doesn't reuse and tries to retransmit this same TRB after we already
> handled it, and gave its corresponding data request back.
>
> Other STALL events might be completely bogus.
> Lukasz Bartosik discovered that xHC DbC might issue spurious STALL events
> if hosts sends a ClearFeature(ENDPOINT_HALT) request to non-halted
> endpoints even without any active bulk tranfers.
>

tranfers - > transfers

> Assume STALL event is spurious if it reports 0 bytes tranferred, and

tranferred -> transferred

> the endpoint stopped on the STALLED TRB.
> Don't give back the data request corresponding to the TRB in this case.
>
> The halted status is per endpoint. Track it with a per endpoint flag
> instead of the driver invented DbC wide DS_STALLED state.
> DbC remains in DbC-Configured state even if endpoints halt. There is no
> Stalled state in the DbC Port state Machine (xhci section 7.6.6)
>
> Reported-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> Closes: https://lore.kernel.org/linux-usb/20240725074857.623299-1-ukaszb@=
chromium.org/
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---

Tested-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>

In the trace below stall errors happen and even though the short
packet is processed
instead of being dropped as it happened previously without this fix.

# tracer: nop
#
# entries-in-buffer/entries-written: 23/23   #P:12
#
#                                _-----=3D> irqs-off/BH-disabled
#                               / _----=3D> need-resched
#                              | / _---=3D> hardirq/softirq
#                              || / _--=3D> preempt-depth
#                              ||| / _-=3D> migrate-disable
#                              |||| /     delay
#           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
#              | |         |   |||||     |         |
      kworker/6:1-460     [006] d..1.   394.400680:
xhci_dbc_handle_event: EVENT: TRB 000000018451a000 status 'Stall Error'
len 0 slot 1 ep 2 type 'Transfer Event' flags e:C
      kworker/6:1-460     [006] d..1.   394.406346:
xhci_dbc_handle_event: EVENT: TRB 000000018451e000 status 'Stall Error'
len 1024 slot 1 ep 3 type 'Transfer Event' flags e:C
      kworker/6:1-460     [006] d..1.   394.406346:
xhci_dbc_handle_transfer: BULK: Buffer 00000002663a4400 length 1024 TD
size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
      kworker/6:1-460     [006] d..1.   394.423119:
xhci_dbc_handle_event: EVENT: TRB 000000018451e000 status 'Short Packet'
len 1000 slot 1 ep 3 type 'Transfer Event' flags e:C
      kworker/6:1-460     [006] d..1.   394.423120:
xhci_dbc_handle_transfer: BULK: Buffer 00000002663a4400 length 1024 TD
size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
      kworker/6:1-460     [006] d..1.   394.423121:
xhci_dbc_giveback_request: bulk-in: req 000000008837f33e length 24/1024
=3D=3D> -6
      kworker/6:1-460     [006] d..1.   394.423123:
xhci_dbc_gadget_ep_queue: BULK: Buffer 00000002663a4400 length 1024 TD
size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
      kworker/6:1-460     [006] d....   394.423124:
xhci_dbc_queue_request: bulk-in: req 000000008837f33e length 0/1024 =3D=3D>=
 -115
      kworker/6:1-460     [006] d..1.   394.423124:
xhci_dbc_handle_event: EVENT: TRB 000000018451e010 status 'Short Packet'
len 733 slot 1 ep 3 type 'Transfer Event' flags e:C
      kworker/6:1-460     [006] d..1.   394.423124:
xhci_dbc_handle_transfer: BULK: Buffer 00000002663a4800 length 1024 TD
size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
      kworker/6:1-460     [006] d..1.   394.423124:
xhci_dbc_giveback_request: bulk-in: req 000000004ed9eda1 length 291/1024
=3D=3D> 0
      kworker/6:1-460     [006] d..1.   394.423125:
xhci_dbc_gadget_ep_queue: BULK: Buffer 00000002663a4800 length 1024 TD
size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
      kworker/6:1-460     [006] d....   394.423125:
xhci_dbc_queue_request: bulk-in: req 000000004ed9eda1 length 0/1024 =3D=3D>=
 -115
        sock->usb-8395    [004] d..1.   394.423930:
xhci_dbc_gadget_ep_queue: BULK: Buffer 00000002663a3400 length 24 TD
size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
        sock->usb-8395    [004] d....   394.423931:
xhci_dbc_queue_request: bulk-out: req 0000000092869359 length 0/24 =3D=3D> =
-115
      kworker/6:1-460     [006] d..1.   394.423939:
xhci_dbc_handle_event: EVENT: TRB 000000018451a000 status 'Success' len
0 slot 1 ep 2 type 'Transfer Event' flags e:C
      kworker/6:1-460     [006] d..1.   394.423939:
xhci_dbc_handle_transfer: BULK: Buffer 00000002663a3400 length 24 TD
size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
      kworker/6:1-460     [006] d..1.   394.423940:
xhci_dbc_giveback_request: bulk-out: req 0000000092869359 length 24/24 =3D=
=3D> 0
        sock->usb-8395    [004] d..1.   394.423951:
xhci_dbc_gadget_ep_queue: BULK: Buffer 00000002663a3400 length 371 TD
size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c
        sock->usb-8395    [004] d....   394.423951:
xhci_dbc_queue_request: bulk-out: req 0000000092869359 length 0/371 =3D=3D>=
 -115
      kworker/6:1-460     [006] d..1.   394.424094:
xhci_dbc_handle_event: EVENT: TRB 000000018451a010 status 'Success' len
0 slot 1 ep 2 type 'Transfer Event' flags e:C
      kworker/6:1-460     [006] d..1.   394.424094:
xhci_dbc_handle_transfer: BULK: Buffer 00000002663a3400 length 371 TD
size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
      kworker/6:1-460     [006] d..1.   394.424094:
xhci_dbc_giveback_request: bulk-out: req 0000000092869359 length 371/371
=3D=3D> 0

>   drivers/usb/host/xhci-dbgcap.c | 133 ++++++++++++++++++++-------------
>   drivers/usb/host/xhci-dbgcap.h |   2 +-
>   2 files changed, 83 insertions(+), 52 deletions(-)
>
> diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgca=
p.c
> index 161c09953c4e..241d7aa1fbc2 100644
> --- a/drivers/usb/host/xhci-dbgcap.c
> +++ b/drivers/usb/host/xhci-dbgcap.c
> @@ -173,16 +173,18 @@ static void xhci_dbc_giveback(struct dbc_request *r=
eq, int status)
>       spin_lock(&dbc->lock);
>   }
>
> -static void xhci_dbc_flush_single_request(struct dbc_request *req)
> +static void trb_to_noop(union xhci_trb *trb)
>   {
> -     union xhci_trb  *trb =3D req->trb;
> -
>       trb->generic.field[0]   =3D 0;
>       trb->generic.field[1]   =3D 0;
>       trb->generic.field[2]   =3D 0;
>       trb->generic.field[3]   &=3D cpu_to_le32(TRB_CYCLE);
>       trb->generic.field[3]   |=3D cpu_to_le32(TRB_TYPE(TRB_TR_NOOP));
> +}
>
> +static void xhci_dbc_flush_single_request(struct dbc_request *req)
> +{
> +     trb_to_noop(req->trb);
>       xhci_dbc_giveback(req, -ESHUTDOWN);
>   }
>
> @@ -649,7 +651,6 @@ static void xhci_dbc_stop(struct xhci_dbc *dbc)
>       case DS_DISABLED:
>               return;
>       case DS_CONFIGURED:
> -     case DS_STALLED:
>               if (dbc->driver->disconnect)
>                       dbc->driver->disconnect(dbc);
>               break;
> @@ -669,6 +670,23 @@ static void xhci_dbc_stop(struct xhci_dbc *dbc)
>       pm_runtime_put_sync(dbc->dev); /* note, was self.controller */
>   }
>
> +static void
> +handle_ep_halt_changes(struct xhci_dbc *dbc, struct dbc_ep *dep, bool ha=
lted)
> +{
> +     if (halted) {
> +             dev_info(dbc->dev, "DbC Endpoint halted\n");
> +             dep->halted =3D 1;
> +
> +     } else if (dep->halted) {
> +             dev_info(dbc->dev, "DbC Endpoint halt cleared\n");
> +             dep->halted =3D 0;
> +
> +             if (!list_empty(&dep->list_pending))
> +                     writel(DBC_DOOR_BELL_TARGET(dep->direction),
> +                            &dbc->regs->doorbell);
> +     }
> +}
> +
>   static void
>   dbc_handle_port_status(struct xhci_dbc *dbc, union xhci_trb *event)
>   {
> @@ -697,6 +715,7 @@ static void dbc_handle_xfer_event(struct xhci_dbc *db=
c, union xhci_trb *event)
>       struct xhci_ring        *ring;
>       int                     ep_id;
>       int                     status;
> +     struct xhci_ep_ctx      *ep_ctx;
>       u32                     comp_code;
>       size_t                  remain_length;
>       struct dbc_request      *req =3D NULL, *r;
> @@ -706,8 +725,30 @@ static void dbc_handle_xfer_event(struct xhci_dbc *d=
bc, union xhci_trb *event)
>       ep_id           =3D TRB_TO_EP_ID(le32_to_cpu(event->generic.field[3=
]));
>       dep             =3D (ep_id =3D=3D EPID_OUT) ?
>                               get_out_ep(dbc) : get_in_ep(dbc);
> +     ep_ctx          =3D (ep_id =3D=3D EPID_OUT) ?
> +                             dbc_bulkout_ctx(dbc) : dbc_bulkin_ctx(dbc);
>       ring            =3D dep->ring;
>
> +     /* Match the pending request: */
> +     list_for_each_entry(r, &dep->list_pending, list_pending) {
> +             if (r->trb_dma =3D=3D event->trans_event.buffer) {
> +                     req =3D r;
> +                     break;
> +             }
> +             if (r->status =3D=3D -COMP_STALL_ERROR) {
> +                     dev_warn(dbc->dev, "Give back stale stalled req\n")=
;
> +                     ring->num_trbs_free++;
> +                     xhci_dbc_giveback(r, 0);
> +             }
> +     }
> +
> +     if (!req) {
> +             dev_warn(dbc->dev, "no matched request\n");
> +             return;
> +     }
> +
> +     trace_xhci_dbc_handle_transfer(ring, &req->trb->generic);
> +
>       switch (comp_code) {
>       case COMP_SUCCESS:
>               remain_length =3D 0;
> @@ -718,31 +759,49 @@ static void dbc_handle_xfer_event(struct xhci_dbc *=
dbc, union xhci_trb *event)
>       case COMP_TRB_ERROR:
>       case COMP_BABBLE_DETECTED_ERROR:
>       case COMP_USB_TRANSACTION_ERROR:
> -     case COMP_STALL_ERROR:
>               dev_warn(dbc->dev, "tx error %d detected\n", comp_code);
>               status =3D -comp_code;
>               break;
> +     case COMP_STALL_ERROR:
> +             dev_warn(dbc->dev, "Stall error at bulk TRB %llx, remaining=
 %zu, ep deq %llx\n",
> +                      event->trans_event.buffer, remain_length, ep_ctx->=
deq);
> +             status =3D 0;
> +             dep->halted =3D 1;
> +
> +             /*
> +              * xHC DbC may trigger a STALL bulk xfer event when host se=
nds a
> +              * ClearFeature(ENDPOINT_HALT) request even if there wasn't=
 an
> +              * active bulk transfer.
> +              *
> +              * Don't give back this transfer request as hardware will l=
ater
> +              * start processing TRBs starting from this 'STALLED' TRB,
> +              * causing TRBs and requests to be out of sync.
> +              *
> +              * If STALL event shows some bytes were transferred then as=
sume
> +              * it's an actual transfer issue and give back the request.
> +              * In this case mark the TRB as No-Op to avoid hw from usin=
g the
> +              * TRB again.
> +              */
> +
> +             if ((ep_ctx->deq & ~TRB_CYCLE) =3D=3D event->trans_event.bu=
ffer) {
> +                     dev_dbg(dbc->dev, "Ep stopped on Stalled TRB\n");
> +                     if (remain_length =3D=3D req->length) {
> +                             dev_dbg(dbc->dev, "Spurious stall event, ke=
ep req\n");
> +                             req->status =3D -COMP_STALL_ERROR;
> +                             req->actual =3D 0;
> +                             return;
> +                     }
> +                     dev_dbg(dbc->dev, "Give back stalled req, but turn =
TRB to No-op\n");
> +                     trb_to_noop(req->trb);
> +             }
> +             break;
> +
>       default:
>               dev_err(dbc->dev, "unknown tx error %d\n", comp_code);
>               status =3D -comp_code;
>               break;
>       }
>
> -     /* Match the pending request: */
> -     list_for_each_entry(r, &dep->list_pending, list_pending) {
> -             if (r->trb_dma =3D=3D event->trans_event.buffer) {
> -                     req =3D r;
> -                     break;
> -             }
> -     }
> -
> -     if (!req) {
> -             dev_warn(dbc->dev, "no matched request\n");
> -             return;
> -     }
> -
> -     trace_xhci_dbc_handle_transfer(ring, &req->trb->generic);
> -
>       ring->num_trbs_free++;
>       req->actual =3D req->length - remain_length;
>       xhci_dbc_giveback(req, status);
> @@ -762,7 +821,6 @@ static void inc_evt_deq(struct xhci_ring *ring)
>   static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
>   {
>       dma_addr_t              deq;
> -     struct dbc_ep           *dep;
>       union xhci_trb          *evt;
>       u32                     ctrl, portsc;
>       bool                    update_erdp =3D false;
> @@ -814,43 +872,17 @@ static enum evtreturn xhci_dbc_do_handle_events(str=
uct xhci_dbc *dbc)
>                       return EVT_DISC;
>               }
>
> -             /* Handle endpoint stall event: */
> +             /* Check and handle changes in endpoint halt status */
>               ctrl =3D readl(&dbc->regs->control);
> -             if ((ctrl & DBC_CTRL_HALT_IN_TR) ||
> -                 (ctrl & DBC_CTRL_HALT_OUT_TR)) {
> -                     dev_info(dbc->dev, "DbC Endpoint stall\n");
> -                     dbc->state =3D DS_STALLED;
> -
> -                     if (ctrl & DBC_CTRL_HALT_IN_TR) {
> -                             dep =3D get_in_ep(dbc);
> -                             xhci_dbc_flush_endpoint_requests(dep);
> -                     }
> -
> -                     if (ctrl & DBC_CTRL_HALT_OUT_TR) {
> -                             dep =3D get_out_ep(dbc);
> -                             xhci_dbc_flush_endpoint_requests(dep);
> -                     }
> -
> -                     return EVT_DONE;
> -             }
> +             handle_ep_halt_changes(dbc, get_in_ep(dbc), ctrl & DBC_CTRL=
_HALT_IN_TR);
> +             handle_ep_halt_changes(dbc, get_out_ep(dbc), ctrl & DBC_CTR=
L_HALT_OUT_TR);
>
>               /* Clear DbC run change bit: */
>               if (ctrl & DBC_CTRL_DBC_RUN_CHANGE) {
>                       writel(ctrl, &dbc->regs->control);
>                       ctrl =3D readl(&dbc->regs->control);
>               }
> -
>               break;
> -     case DS_STALLED:
> -             ctrl =3D readl(&dbc->regs->control);
> -             if (!(ctrl & DBC_CTRL_HALT_IN_TR) &&
> -                 !(ctrl & DBC_CTRL_HALT_OUT_TR) &&
> -                 (ctrl & DBC_CTRL_DBC_RUN)) {
> -                     dbc->state =3D DS_CONFIGURED;
> -                     break;
> -             }
> -
> -             return EVT_DONE;
>       default:
>               dev_err(dbc->dev, "Unknown DbC state %d\n", dbc->state);
>               break;
> @@ -939,7 +971,6 @@ static const char * const dbc_state_strings[DS_MAX] =
=3D {
>       [DS_ENABLED] =3D "enabled",
>       [DS_CONNECTED] =3D "connected",
>       [DS_CONFIGURED] =3D "configured",
> -     [DS_STALLED] =3D "stalled",
>   };
>
>   static ssize_t dbc_show(struct device *dev,
> diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgca=
p.h
> index 0118c6288a3c..97c5dc290138 100644
> --- a/drivers/usb/host/xhci-dbgcap.h
> +++ b/drivers/usb/host/xhci-dbgcap.h
> @@ -81,7 +81,6 @@ enum dbc_state {
>       DS_ENABLED,
>       DS_CONNECTED,
>       DS_CONFIGURED,
> -     DS_STALLED,
>       DS_MAX
>   };
>
> @@ -90,6 +89,7 @@ struct dbc_ep {
>       struct list_head                list_pending;
>       struct xhci_ring                *ring;
>       unsigned int                    direction:1;
> +     unsigned int                    halted:1;
>   };
>
>   #define DBC_QUEUE_SIZE                      16

