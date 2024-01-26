Return-Path: <linux-usb+bounces-5546-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA6683E337
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jan 2024 21:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C5C91C249EC
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jan 2024 20:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70AED22EF8;
	Fri, 26 Jan 2024 20:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Xb42bPK9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B46523745
	for <linux-usb@vger.kernel.org>; Fri, 26 Jan 2024 20:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706300260; cv=none; b=JT7qApLmxzvAX9xb35036WZZXUHTny99IqXl03YZkwbHiReK0sWuD70xIAdKVTFmkMfTFMSs3aW4GF3u3ra5FEoiXmlvWiV0VJYawYGy+LGIOYFIXMJs27Q1LeW2p8cBp5RkZkASTDmBq+25CuKATyuRjTA4fF6G5h2HuEZDUU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706300260; c=relaxed/simple;
	bh=HAQPps5wjqE0jv8rgN+WS1Gw3/xSMCClPFvhNPdQHGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fy8dglaYAhHhofSndsIH9xhqa8kHz4N5zPHRgX3c8F5tXxcvnkWGKGSiELZx3Wz30zfTOOxfkh0wmwv7FvNifs2FIpBFN0O8I9MDo3pklLCI68ZQGen0q9yTGXqwSAcF9CcHRMDMtpBrGynOJCBc8b1xCLV9o6ge8vZo127MG3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Xb42bPK9; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-68192840641so3805676d6.1
        for <linux-usb@vger.kernel.org>; Fri, 26 Jan 2024 12:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706300257; x=1706905057; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAQPps5wjqE0jv8rgN+WS1Gw3/xSMCClPFvhNPdQHGM=;
        b=Xb42bPK9vDS0/pnhLKk8rm/spr/1sx0zMw3SkAotGXPUBI2/b54OzKDFlBW0TQqkze
         +X1g/DkMT3HvzuHRASpRRY6iDq4VmYuoPMQC6k4fnJIXUH+K4p4GaasBll8lkv+knqWP
         9qsEgVR9dR7CZ7jb7Nsc0k2u9qpmUB3MiwThM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706300257; x=1706905057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAQPps5wjqE0jv8rgN+WS1Gw3/xSMCClPFvhNPdQHGM=;
        b=S4RQ4+zrSZf4EQSD2rmGv21PgF4CGnTxpBDPDjQR1xSEDEs5brEY1oT6T5+bwQumNO
         q34cPnyEXo2fuVNosrRSesOB+TlpOKguBInTDunBFfpge47cKdfE4VzzIIsEUzvxo+OE
         yUHcRTn0PyNcsQU9U53b7YaMeiRePM42FHipP6ZoN096CRrN4hnCJsQx3Sg+3/cP+3XO
         3nRHo42xTW8cHCw3d09cCCQF0CfyswwLSg4ItRxjlKBVENat8fEmKHEx/U/AmZjRoq3W
         mX+C1xrRAFv+5AS2BCPrmYwpZYiXzm1TuiX7c/o/I8jUiYMW02BkrM3uosq+d6znRxcs
         YGuA==
X-Gm-Message-State: AOJu0YyCoGo9GDkpTUL41xkMoblwAZpJLcVLt2YdT8W+rEEQIiYAf3Pi
	uqFHpTVIVmCyGWa5JWdq7YwoYFywNSTnFA65xN3su5MAhD1enDZvsSOLrxNEc9q3Uu9EEqtLJvo
	zn7SXN2Ce9A4S225wC8m/CaAxhHq31uwUkLKQ
X-Google-Smtp-Source: AGHT+IH3hmMaDuQ1sT/ZwqdihzxZDCKDIP3hCeyFxzrsixzIj08hxydz1qbiGNbIbBS40bI7tABYJovXTMftsaSBjJI=
X-Received: by 2002:a05:6214:27e9:b0:685:606e:dc22 with SMTP id
 jt9-20020a05621427e900b00685606edc22mr459042qvb.45.1706300257561; Fri, 26 Jan
 2024 12:17:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240126183930.1170845-1-abhishekpandit@chromium.org> <20240126103859.v3.1.Iacf5570a66b82b73ef03daa6557e2fc0db10266a@changeid>
In-Reply-To: <20240126103859.v3.1.Iacf5570a66b82b73ef03daa6557e2fc0db10266a@changeid>
From: Prashant Malani <pmalani@chromium.org>
Date: Fri, 26 Jan 2024 12:17:26 -0800
Message-ID: <CACeCKadp_qk-QHOd3Yr8W72w8WM3kFvQKOvALWcinfPh_55qfA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] usb: typec: ucsi: Limit read size on v1.2
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, 
	jthies@google.com, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Prashanth K <quic_prashk@quicinc.com>, 
	Rajaram Regupathy <rajaram.regupathy@intel.com>, Saranya Gopal <saranya.gopal@intel.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Abhishek,

On Fri, Jan 26, 2024 at 10:39=E2=80=AFAM Abhishek Pandit-Subedi
<abhishekpandit@chromium.org> wrote:
>
> Between UCSI 1.2 and UCSI 2.0, the size of the MESSAGE_IN region was
> increased from 16 to 256. In order to avoid overflowing reads for older
> systems, add a mechanism to use the read UCSI version to truncate read
> sizes on UCSI v1.2.
>
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Please pick up review tags that you've received for previous versions
(unless the patch
has changed drastically).

Reviewed-by: Prashant Malani <pmalani@chromium.org>

