Return-Path: <linux-usb+bounces-37737-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DuxJK/CDGqJlgUAu9opvQ
	(envelope-from <linux-usb+bounces-37737-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 22:06:07 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F5E584776
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 22:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E1BF30E82E6
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 20:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044EE3B776A;
	Tue, 19 May 2026 20:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eRy4FCM0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F0F3B895E
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 20:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779220854; cv=pass; b=QE5f9ydp1HMSK2tv+zpENYnoXQuWQV4eejdy2hX1eGwGVlujtHyzkQZnEusUsWPF3Rzdbar6BR5+KghACanQjUDnpR5CzIpPI3BoWxYcjv3WpFPTmPAqfTkd19Puphb+SWMwQGEz5Gf+8LlNMkAIAYuMyCej/QkLOg33umni5hM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779220854; c=relaxed/simple;
	bh=z7+sfmzLCX7hEqfJ1RwkmJbENGq19gZ2ufHyFzYnu30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qEWhy6UhrsbIN9xxk1aKthSAJ4eUpSjYwr81kLaX2BlPcX91h38k8rtA/cQyelxFEb8JOiXrTgGC0xP+cRzUq4ZcFZG+alkLLEtiiI7HkU4r2+6VfKGd55u947pd8dKvbvV/OpWUTylP51gKMQqy6fNCF0XgQCsFwMg0W2QRtLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eRy4FCM0; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-367c26471f5so2513521a91.1
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 13:00:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779220844; cv=none;
        d=google.com; s=arc-20240605;
        b=Q3TrnVzAumq3gFUGKIBmzSX4qTY27iPf3O2cvE3TZHURuwjRLXGycO9013D9+UlgH2
         udvQb5hMmMqBsrICtd8lnjJRM9S4RhO4ZUBdMfJG8ajJ9QvIdO7hkegCNeM7eYOLwIVm
         rdvL89D8BcwivjrgqUIPMtJB5jyaPpMOH4LysMg/iA+1fyE8tLUK8ONJm3ONHarrJDcs
         kurel7RsA92d96QP1RQ2xtDJ+iaM6DpCzUlFIzMP2WgvajBP6SM8TcUZuBNKPRDr9dQH
         m+tWheT/nre8G4IN3PIpaiiFl9abcaDECaKUkf/hCrVeLL4KJCVLCQLUPo8KQ9R2Z7gC
         p4/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wbs6RKb+SG4mqMMp86P42C7RHS2rVTLotKJFep45jqk=;
        fh=K9MJrs9X2TYMwoDP/1/J+Qo3L1qN68xjd2B288ODUQ8=;
        b=XRKioCKiWi/jWZ47ywT0l2ZvBTam9tqLOQhBYfu14oJlp+pwVZ+Bxmp7LRhuAKkG+q
         OQpxD7horCTacudaWie2KvRQ+mLbM7pAbHCCIZY8N8hhiSa5yKkayd63zB39btmn0VFG
         44RJ4eBCbD5n8Px9cOeMt1VRy2OmUb/4fG40C2wTJ58UjjvOzipZ/kr4pk1bNR1kfzJP
         c2kfQ2lnqx5s+t8n+WGLMIFp+MTzds3aqsH3TWGZ6xIsl2zLRefmPhz4RIV+pdfkW9vE
         RPNdlBhm4NoI1S/uxtYQ5dQ6Xn8lduu5usCwk236zShmva8/fx+AeL9V9hgMFXFLhBpa
         nLQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779220844; x=1779825644; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbs6RKb+SG4mqMMp86P42C7RHS2rVTLotKJFep45jqk=;
        b=eRy4FCM0KqVzmIKM/M6Nep7mXqnrhuJ9ymk869TNDLp58R8eL75gCFs5M91P7FyPll
         vbKAqRj3fMByiz2hh2HqpYUXLJ8ZcW3viDryX0Upsl9sTylwHNIxnLTfiGlefFqYQ8e1
         XA8smPA05sDKyhlf+hw0Ch25dcAgPP5BL1u3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779220844; x=1779825644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wbs6RKb+SG4mqMMp86P42C7RHS2rVTLotKJFep45jqk=;
        b=VfGnk861P8teRgABfbdyUuJMlKWnE066PiwsOWWZaCJCAw4dPQ0yARyEQQH0vfniXv
         gPp8mi3uLtUDyhPjHa+1WD7yRi31zKlsTmcclzHJGJcMr4+tqMP5J/pfnYHkoPAdhr8I
         UQqpx4dNzWX7R3/zG34lpElfKYsInJ2ThTVZKed95hQpGZTJkt88WmzZzrJSQruiBYNU
         Z3ALDuP1EPMv3YNL3b03MPdH3hkMrby6WyGFk7S+B9kPGfT76X5ASjOpmYyn9RQXhMSL
         wO78vp4R7ZfJ0L9g+Y5Vf5MaPTM5CAo2lF69P5eWN+DWBdgNAkyH4+Xz2uUHBOjLTvOe
         XIWQ==
X-Gm-Message-State: AOJu0YyJs54kW1vdpXq87sz+RFTiLtL6Fnic3Z2VKh+8xbWlDlv7C9fU
	UOiBBzprHy4KXa4pqSBGXGaj0IrmAI2UpGgDofxoOmiMsBS5a+30+4oU8Z4AnNwwl6XL0UBVO9V
	CGEWZAW9uwfio52ba35aZp/NERwqtg5mEVp+OnMwJ
X-Gm-Gg: Acq92OGumEM478um6+b4g/G8DRIuNbMH/pAFEvZUWkoe6F3b0mq9uvM6trfemdNLETK
	TdPDT77NW0qBUm1lvxgTQ1+Z2PnKYo/nrlhOpiMeoMo/32xs38sA63ZFJSo4PPAC8dOlwBwcK7e
	h7Dg73FuyeUa8DFMnOyZPZvlIG2Ld11cBmTzFKpXQpc0beuK1LfVDLyJczHoc7Escy5FwufxA1j
	XX6x1gyeU6ah497SPlb11Oq+QrXnJiptAlCxnCXAzlJ7Dt6FV+LSFuwr+GEGLwietTMo0g/b4bk
	Ls8nRkY=
X-Received: by 2002:a17:90b:1fce:b0:368:5367:d679 with SMTP id
 98e67ed59e1d1-369519cb5d1mr20288945a91.9.1779220844382; Tue, 19 May 2026
 13:00:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2026051347-clustered-deflected-9543@gregkh> <2026051351-truck-steadfast-df48@gregkh>
In-Reply-To: <2026051351-truck-steadfast-df48@gregkh>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Tue, 19 May 2026 13:00:28 -0700
X-Gm-Features: AVHnY4LM7BeF7Zv2PRjVrqlS5Ca-7qdDy18IZMI9cpTwker3DKO6PwurMNRqLGQ
Message-ID: <CANFp7mVZ1rFkPu5wNZOxm6QBWDwcKvKeCPjYdRKdkWn2KWR5jw@mail.gmail.com>
Subject: Re: [PATCH 8/8] usb: typec: ucsi: validate connector number in ucsi_connector_change()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Nathan Rebello <nathan.c.rebello@gmail.com>, 
	Johan Hovold <johan@kernel.org>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Hsin-Te Yuan <yuanhsinte@chromium.org>, Abel Vesa <abelvesa@kernel.org>, 
	stable <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37737-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,chromium.org,google.com,gmail.com,kernel.org,intel.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhishekpandit@chromium.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,chromium.org:email,chromium.org:dkim,linuxfoundation.org:email]
X-Rspamd-Queue-Id: E7F5E584776
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 13, 2026 at 9:02=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> The connector number in a UCSI CCI notification is a 7-bit field
> supplied by the PPM.  ucsi_connector_change() uses it to index the
> ucsi->connector[] array without checking it against the number of
> connectors the PPM reported at init time, so a buggy or malicious PPM
> (EC firmware, or an I2C-attached UCSI controller on the ccg / stm32g0 /
> glink transports) can drive schedule_work() on memory past the end of
> the array.
>
> Reject connector numbers that are zero or exceed cap.num_connectors
> before dereferencing the array.
>
> Assisted-by: gkh_clanker_t1000
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Jameson Thies <jthies@google.com>
> Cc: Nathan Rebello <nathan.c.rebello@gmail.com>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Pooja Katiyar <pooja.katiyar@intel.com>
> Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: stable <stable@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.=
c
> index 5b7ad9e99cb9..539dc706798d 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1380,13 +1380,22 @@ static void ucsi_handle_connector_change(struct w=
ork_struct *work)
>   */
>  void ucsi_connector_change(struct ucsi *ucsi, u8 num)
>  {
> -       struct ucsi_connector *con =3D &ucsi->connector[num - 1];
> +       struct ucsi_connector *con;
>
>         if (!(ucsi->ntfy & UCSI_ENABLE_NTFY_CONNECTOR_CHANGE)) {
>                 dev_dbg(ucsi->dev, "Early connector change event\n");
>                 return;
>         }
>
> +       if (!num || num > ucsi->cap.num_connectors) {
> +               dev_warn_ratelimited(ucsi->dev,
> +                                    "Bogus connector change on %u (max %=
u)\n",
> +                                    num, ucsi->cap.num_connectors);
> +               return;
> +       }
> +
> +       con =3D &ucsi->connector[num - 1];
> +
>         if (!test_and_set_bit(EVENT_PENDING, &ucsi->flags))
>                 schedule_work(&con->work);
>  }
> --
> 2.54.0
>
>

