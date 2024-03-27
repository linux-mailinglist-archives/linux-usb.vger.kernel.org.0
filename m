Return-Path: <linux-usb+bounces-8475-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C1B88E641
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 15:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 214191C2DA52
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 14:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2909ADDD7;
	Wed, 27 Mar 2024 13:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gXo+6lWC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9948B12F5A2
	for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 13:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711544804; cv=none; b=LdzLl+3lMuh1oczwwE7djAu2OKMqYGjgPgm8yp5uri5AKOqY0yof2VVzYmuCtm0Xe4SnPOdWsW/6biEBcTKI8KFvswn7rec2P19+8+JidMkUj/oQOJ7jediA/UkGzvHD5843y6y2yKYGxUgcLqLDUKIh5DOvaaj8FUIZa/J4cys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711544804; c=relaxed/simple;
	bh=9meHS8Lfdmj3vcUYKfnEr2HZRk3IB/+UZZBUKIbNQc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tBJizWD22eMy1lKKuzCzWkdp6d/tNKLGxDYlWbv1DP9hpAwMEkhjJDKxWQccY1Nw8loJ6ERy6H/L7VLV6JcTKKv/EdSvMs4dyGxREhp93j08B9bIRrjFH0lrAhEOKcOLoaGGSQoFKPW3da350p77YEJlzcmuqQpyO5nuyb46AO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gXo+6lWC; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3c3d7e7402dso1110306b6e.1
        for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 06:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711544801; x=1712149601; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=26L6xqxxUDbfEZ3xFQJim+vSF6j2wqKdCzVIznj3EeU=;
        b=gXo+6lWCVepOdNqZw4ARTDC9wBkkgA4QAVHkb3dVKg5YHRB7OlDK0uAzn3/aGmA+TX
         U1fhKgB7s6eG6SS4nwTIoFcwPU6n8KtSlxwoeCU3b36jAFEVlXIgcJca+G/LVvK4zuB6
         8j1IEAQdzQgmxQdpR8GAzuPCn/Ib0dS7LaN9cHeLlitpSbU7s/fzlNDHMuR/Rk7ahFuZ
         bJsTd9jG4C6F44mJKHnS1IRggJsHy34K0c0z4i4f39Vd8BWkqNdIHjeHJaAcnoI0S4Xq
         396lUJY7u3E8JZEvBJmQ9ATbq+BFkUF8L04OgPsLbr9Nh405tKXQw3I3effaQfI4EeZI
         Tymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711544801; x=1712149601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26L6xqxxUDbfEZ3xFQJim+vSF6j2wqKdCzVIznj3EeU=;
        b=DaZa4QHgHJUKKw1lHdX57WNg3tHViBZ/hkhRKE+1vOdCCAA8CaoQ9755bCQUbkSQUh
         UD77sO18wOEhDBHAlqacmBDLpaoJD8O2P+Hw4tYz3YVDl6Vnk3LsZVI7QucwFoAn7yzq
         iE3DnQymLeJ4UJdu9oFLz3qGGB14rObvXxEpsCNGy4ad/5Eg3uYVnKaDbxq+k0EFizAy
         fsSDaovtPd176y9AT6XkMcZPK5OSOfCH0utLhnMyCYDi14MknfxgO2ndZEK128E9Vl4k
         FhKU442xhoVatljfalzj7CXySxGLeCZcWtorGvGMDt7HjYHufV8MeRObicALOPwKNHAx
         49Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVVOmRjynR171t8fMpYwDSTl0XANFG40bmbAHuuZpOFKtAWZjiSIBJWJJZKhUzAkKLI9Y93+Wca32BTQRAkt/RuBZRU+rZ7wMj/
X-Gm-Message-State: AOJu0YzYptaiEtSEuqGqqMJ0rEnMPfNXEjQnMyNJJqXqEjDYTZ0lM4CZ
	I5TRQB3pjO35UqEAJyRTPj7wgTy/sqT/ct5hzvEr+nxN/WBf0RiVV0kowJPYnxatKyXqWEObOvI
	yNOqD1a5gIvhbOdG/yW31VGaYc5rrK0XSdeFU/Q==
X-Google-Smtp-Source: AGHT+IGkd4KQCBSemK1UOlDt1i4uRJe5DP56rCpaNIiQl7Bu5pwtJkVUo+MUue/CcsR2gFASVM4UJEu4uIF09h237KM=
X-Received: by 2002:a05:6808:1242:b0:3c2:2cf8:b8d with SMTP id
 o2-20020a056808124200b003c22cf80b8dmr1105397oiv.55.1711544800029; Wed, 27 Mar
 2024 06:06:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <vuh25ueep3rwcmthlkvhb2avpkqzc6lsbee3qdmerolijq7azq@rwmakgznqvmq>
In-Reply-To: <vuh25ueep3rwcmthlkvhb2avpkqzc6lsbee3qdmerolijq7azq@rwmakgznqvmq>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 27 Mar 2024 15:06:28 +0200
Message-ID: <CAA8EJpo8rppXZm+-nKMG1LS0V+HCz3g1ajZVY2TmedRnZ9C3JA@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: typec: ucsi: ack connector change after all
 tasks finish
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	neil.armstrong@linaro.org, quic_prashk@quicinc.com, 
	fabrice.gasnier@foss.st.com, saranya.gopal@intel.com, lk@c--e.de, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Mar 2024 at 14:39, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt> wrote:
>
> The UCSI specification mentions that when the OPM is notified by the
> PPM of an asynchronous event it should first send all the commands it
> needs to get the details of the event and only after acknowledge it by
> sending ACK_CC_CI with the Connector Change bit set, while the current
> code sends this ack immediately after scheduling all the partner_tasks.
> Move this ACK_CC_CI command to the end of all partner_tasks.
>
> This fixes a problem with some LG Gram laptops where the PPM sometimes
> notifies the OPM with the Connector Change Indicator field set in the
> CCI after an ACK_CC_CI command is sent, causing the UCSI stack to check
> the connector status indefinitely since the EVENT_PENDING bit is already
> cleared. This causes an interrupt storm and an artificial high load on
> these platforms.
>
> It would also be interesting to see if we could take this approach and
> implement the discussion in [1] regarding sending an ACK_CC_CI command
> that acks both the command completion and the connector change.
>
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>
> [1]: https://lore.kernel.org/all/20240320073927.1641788-1-lk@c--e.de/

We had similar issue, see
https://lore.kernel.org/linux-arm-msm/20240313-qcom-ucsi-fixes-v1-1-74d90cb48a00@linaro.org/


> ---
>  drivers/usb/typec/ucsi/ucsi.c | 27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 0c8f3b3a99d6..b8b39e43aba8 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -69,6 +69,23 @@ static int ucsi_acknowledge_connector_change(struct ucsi *ucsi)
>         return ucsi->ops->sync_write(ucsi, UCSI_CONTROL, &ctrl, sizeof(ctrl));
>  }
>
> +static void ucsi_handle_ack_connector_change(struct ucsi_connector *con)
> +{
> +       struct ucsi *ucsi = con->ucsi;
> +       int ret;
> +
> +       if (list_empty(&con->partner_tasks)) {
> +               mutex_lock(&ucsi->ppm_lock);
> +               ret = ucsi_acknowledge_connector_change(ucsi);
> +               mutex_unlock(&ucsi->ppm_lock);
> +
> +               if (ret)
> +                       dev_err(ucsi->dev, "%s: ACK failed (%d)", __func__, ret);
> +
> +               clear_bit(EVENT_PENDING, &ucsi->flags);
> +       }
> +}
> +
>  static int ucsi_exec_command(struct ucsi *ucsi, u64 command);
>
>  static int ucsi_read_error(struct ucsi *ucsi)
> @@ -222,6 +239,7 @@ static void ucsi_poll_worker(struct work_struct *work)
>                 list_del(&uwork->node);
>                 mutex_unlock(&con->lock);
>                 kfree(uwork);
> +               ucsi_handle_ack_connector_change(con);
>                 return;
>         }
>
> @@ -232,6 +250,7 @@ static void ucsi_poll_worker(struct work_struct *work)
>         } else {
>                 list_del(&uwork->node);
>                 kfree(uwork);
> +               ucsi_handle_ack_connector_change(con);
>         }
>
>         mutex_unlock(&con->lock);
> @@ -1215,13 +1234,7 @@ static void ucsi_handle_connector_change(struct work_struct *work)
>         if (con->status.change & UCSI_CONSTAT_CAM_CHANGE)
>                 ucsi_partner_task(con, ucsi_check_altmodes, 1, 0);
>
> -       clear_bit(EVENT_PENDING, &con->ucsi->flags);
> -
> -       mutex_lock(&ucsi->ppm_lock);
> -       ret = ucsi_acknowledge_connector_change(ucsi);
> -       mutex_unlock(&ucsi->ppm_lock);
> -       if (ret)
> -               dev_err(ucsi->dev, "%s: ACK failed (%d)", __func__, ret);
> +       ucsi_handle_ack_connector_change(con);
>
>  out_unlock:
>         mutex_unlock(&con->lock);
> --
> 2.44.0
>


-- 
With best wishes
Dmitry

