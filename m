Return-Path: <linux-usb+bounces-16925-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D30399B8768
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2024 01:00:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2770EB21DA6
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2024 00:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25BEA4DA04;
	Fri,  1 Nov 2024 00:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R56GkXfw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E925D1E3DFE
	for <linux-usb@vger.kernel.org>; Fri,  1 Nov 2024 00:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730419206; cv=none; b=XVQVwEOgMIllniPnznkZ+GyLgFJnezr1ZK/UIe7WvYCWPdwbqaVtyaFeyymxI7p6Rv60cSAy1Ge4u73UYND/ZVuemLSMihuQU8XNxk96g56AtDxqcsJJv8BnyMZzGs0B8kI+CocAlFp1zEuTg7vZNMeW3bij0Q8njbx/6kPtdng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730419206; c=relaxed/simple;
	bh=dwDn0TURDpWQmYISsxqoCtZReaNWkDo/PboWB6G0Owk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Kjlwvhr+7YErgzTDVOHrb7BnfBSdFykKipvXcBamKyEKdcnXAo4VQ/8+x7+LwTpKrjy8w7mv70fevZ+RaGFVwfMCkiXZWAu+WyIpBu4BQeTCsBzPqjA2Mg4MSi0VVFsD/UkTEqsG5ZEC4Fl4StfNx77P/HsU8ktQCw7A+rae5pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R56GkXfw; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e28fc60660dso2318244276.0
        for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 17:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730419200; x=1731024000; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cEt3MVqqxDBbCecmuXKd75lsXhmWRHU5J08RIUulB2g=;
        b=R56GkXfwinT9W16ByaGxSoECb/FeGethy5g0k1W96PZIrwQZfLH8H5+znGLkuiYM3J
         f1azHLTsdALoqPNyuhpknq7cnRPOqr0JQsCs+PU9SWgWqeKSzNA2NEB85VVtq/AHn7kS
         Fq4GK5L5rdXgSgXndkFCZNtNXBKZO8cvWqZv+DwpZ9rImdt2Tbk6YNv53OaW5qZ7ZtGs
         y5gPIUlBukw/LDivvCcNDB3/3qQ88EvW+hJDtAhI7A2g3gSurook4WosrntMNZ750yaa
         X2JmnFh9wsC3s7JL0TCfY59UqbW7facYJfTdS8g5zVq1qmkA9ArQRnMmMxYDyNF8typ3
         GooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730419200; x=1731024000;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cEt3MVqqxDBbCecmuXKd75lsXhmWRHU5J08RIUulB2g=;
        b=CUdpUKrD8ifkN8p3WPLJPtb4uWIPXSOz2iIfuiCh132FDmu4JR8cWeR+f1tuyByjAp
         8BXxtEoRXCpjdN7ClgmfSVDAtHWMnPXKH4ncsrKJZhCU3RkSTWwyK4D6HCRxbavwrJzy
         5SfeGZDDOmWgpucXtlUx6kUPaXRn57so8P7IbestBugi5kdv1GWyO/V3qD48Zrz/hqFn
         0mrs+MO2C/4A0yN2fDNgXZyrnhtd7jv8f3rN83NsZ8vcM0jvq0+7im7hx/kJScayhhBM
         RwiLS/pfCX5zIJJaIxK/M7iE8Cgt/Sq0yHiUVRobqH3ouYLYp/PXqMUzOEOUlY8jKcyW
         xXFw==
X-Forwarded-Encrypted: i=1; AJvYcCXf6+iGs4moQRs5B10LCqYFg0cwoj/bbsybOUan6nfW0bapzTdU/LE1k31kP4uACG0h+2X0d+wmwrA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx555eTSjOzjDIOqzjYb4aOIiVThC8tZvuFrJmevE947ZrSpx7+
	Cfs62G5r7O+nxJXWvyk/GpEsBos1H+3skQ6BYuVrdam6RkPhlTmLhjxPckr979vjqSv8pC3ZQl1
	nTA==
X-Google-Smtp-Source: AGHT+IEXZV3G3jh5U5saB7BhlzBPRlhCsxeQIBe08kK/8AySWU+uLXqwjkKqdarvd1ytRanLG3qi1O/CSHg=
X-Received: from amitsd-gti.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:827])
 (user=amitsd job=sendgmr) by 2002:a25:abc1:0:b0:e30:cee4:1431 with SMTP id
 3f1490d57ef6-e30cee41523mr14871276.1.1730419199960; Thu, 31 Oct 2024 16:59:59
 -0700 (PDT)
Date: Thu, 31 Oct 2024 16:59:51 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Message-ID: <20241031235957.1261244-1-amitsd@google.com>
Subject: [PATCH v1 0/3]  Add new time property for battery charger type detection
From: Amit Sunil Dhamne <amitsd@google.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com
Cc: dmitry.baryshkov@linaro.org, kyletso@google.com, rdbabiera@google.com, 
	badhri@google.com, linux@roeck-us.net, xu.yang_2@nxp.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, Amit Sunil Dhamne <amitsd@google.com>
Content-Type: text/plain; charset="UTF-8"

This patchset adds a new time DT property to handle time taken by
battery charger type detection completion.

Note that BC detection is based on
"Battery Charging Specification Revision 1.2".

This patchset depends on the patch series:
 - https://lore.kernel.org/all/20241022-pd-dt-time-props-v1-0-fea96f51b302@google.com/

Amit Sunil Dhamne (3):
  dt-bindings: connector: Add time property for Sink BC12 detection
    completion
  dt-bindings: usb: maxim,max33359.yaml: add usage of sink bc12 time
    property
  usb: typec: tcpm: Add support for sink-bc12-completion-time-ms DT
    property

 .../bindings/connector/usb-connector.yaml        | 11 +++++++++++
 .../devicetree/bindings/usb/maxim,max33359.yaml  |  1 +
 drivers/usb/typec/tcpm/tcpm.c                    | 16 +++++++++++++++-
 3 files changed, 27 insertions(+), 1 deletion(-)


base-commit: 0fc810ae3ae110f9e2fcccce80fc8c8d62f97907
prerequisite-patch-id: c08696694dabcbb86b458a935a9cbbcbabb75672
prerequisite-patch-id: 634924883df820956acb33941b659e8c9ef85d1e
-- 
2.47.0.199.ga7371fff76-goog


