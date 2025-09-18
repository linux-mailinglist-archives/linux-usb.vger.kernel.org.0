Return-Path: <linux-usb+bounces-28270-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0160B83C4E
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 11:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA73D3A9178
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 09:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7A1302CD0;
	Thu, 18 Sep 2025 09:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MtZ198vA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AB52FF648;
	Thu, 18 Sep 2025 09:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758187475; cv=none; b=HdgQIKGW2shnOMeogb5N93C9noCX6wA5NxaWW5nyRmL7k2Kk0d8CuJsZPKbc8ASt7OIlEfnpEVZteuoNJXG8VPsa/Nb8OcUL6JZDkr10mlU5P9q5h5/xhDF8T8qsIvREflyYUAihooS3TQ+9dROVtHFNNZjrkb5QpW9EeK08Jh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758187475; c=relaxed/simple;
	bh=0AYh4Kq94+K9Q9GhBTgVtjkUCdxvjg6DMvyhydU1efM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gsWctnX47qmTGQwd03YnaG0uJsTzXEUgVm39B9MwG4cV8gkBAUiX2BtKoss6L1zUCwVtWC5X1rJE9TnpvUOBLoEosmr2DeNdDQwVN698SrpBnrMm9Pa2FhlxPsDlqnnRpJ3Ce0lyY6mD5pYzoCl/UYs8ai4ZlJDlLecKuW3HXOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MtZ198vA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34B5CC4CEF1;
	Thu, 18 Sep 2025 09:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758187475;
	bh=0AYh4Kq94+K9Q9GhBTgVtjkUCdxvjg6DMvyhydU1efM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MtZ198vATguRK+2UeXGZbJqYzEBrMUJMBApVO7hMkHFtp3fJrzZdlGjmkW3u5j+AH
	 7yWgCgs+vFDAwWrlXzJrHPFXj41IKrcOnxeH3uouxkkjJAV4PbCvAOBWPhyvyUeci6
	 1tUf7ya/rpszQwfW4Kakpagb36NxPW8pIeI1pXYtByt7L+Or4RSJKFkMP4A2Yu6exi
	 yvgvbxmbs+px+x7PMVU16VpQkHRU3Hf7+QUzO3bvVnZI4eLsN+cU0MKS+MpA3XRv/s
	 fd1V1c2F7fmbOjKl6dPr1sy9gvlC81naL4U22Gvee7Xjbma9qQH6MOBx0Tx8t6zCSx
	 WFXFqSfQtSVgw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25160CAC5A9;
	Thu, 18 Sep 2025 09:24:35 +0000 (UTC)
From: Cryolitia PukNgae via B4 Relay <devnull+cryolitia.uniontech.com@kernel.org>
Date: Thu, 18 Sep 2025 17:24:31 +0800
Subject: [PATCH v4 2/5] param: export param_array related functions
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-sound-v4-2-82cf8123d61c@uniontech.com>
References: <20250918-sound-v4-0-82cf8123d61c@uniontech.com>
In-Reply-To: <20250918-sound-v4-0-82cf8123d61c@uniontech.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>
Cc: linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>, 
 Nie Cheng <niecheng1@uniontech.com>, Zhan Jun <zhanjun@uniontech.com>, 
 Feng Yuan <fengyuan@uniontech.com>, qaqland <anguoli@uniontech.com>, 
 kernel@uniontech.com, linux-modules@vger.kernel.org, 
 Cryolitia PukNgae <cryolitia@uniontech.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758187473; l=2799;
 i=cryolitia@uniontech.com; s=20250730; h=from:subject:message-id;
 bh=Iu09dllz6TNtY0M5KhKHic/tph0IN8w4KA3fww/CJfM=;
 b=T3cSpNzBi5jROvwC1BFCwr4GCxzo9h8GL1HRhwx+jcUK2ExVvywIBhzmIOST4WRL8Jq+pGBa0
 NEnITolOir5CyxS2jYR7UCfLP0zx2ELqJhR2JgKDVYJMe9nju/rZ23N
X-Developer-Key: i=cryolitia@uniontech.com; a=ed25519;
 pk=tZ+U+kQkT45GRGewbMSB4VPmvpD+KkHC/Wv3rMOn/PU=
X-Endpoint-Received: by B4 Relay for cryolitia@uniontech.com/20250730 with
 auth_id=474
X-Original-From: Cryolitia PukNgae <cryolitia@uniontech.com>
Reply-To: cryolitia@uniontech.com

From: Cryolitia PukNgae <cryolitia@uniontech.com>

- int param_array_set(const char *val, const struct kernel_param *kp);
- int param_array_get(char *buffer, const struct kernel_param *kp);
- void param_array_free(void *arg);

It would be helpful for the new module param we designed in
snd_usb_audio, in order to run additional custom codes when params
are set in runtime, and re-use the extisted codes in param.c

Signed-off-by: Cryolitia PukNgae <cryolitia@uniontech.com>
---
 include/linux/moduleparam.h | 3 +++
 kernel/params.c             | 9 ++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index 3a25122d83e2802e6e6a1475a52816251498b26a..4ef09ad2004789855bd21783029c653fac94b9dd 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -593,6 +593,9 @@ enum hwparam_type {
 
 
 extern const struct kernel_param_ops param_array_ops;
+extern int param_array_set(const char *val, const struct kernel_param *kp);
+extern int param_array_get(char *buffer, const struct kernel_param *kp);
+extern void param_array_free(void *arg);
 
 extern const struct kernel_param_ops param_ops_string;
 extern int param_set_copystring(const char *val, const struct kernel_param *);
diff --git a/kernel/params.c b/kernel/params.c
index b96cfd693c9968012d42acb85611fee1acd47790..a936e018a1c6d0bf2b6b4566f80751840366f652 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -462,7 +462,7 @@ static int param_array(struct module *mod,
 	return 0;
 }
 
-static int param_array_set(const char *val, const struct kernel_param *kp)
+int param_array_set(const char *val, const struct kernel_param *kp)
 {
 	const struct kparam_array *arr = kp->arr;
 	unsigned int temp_num;
@@ -471,8 +471,9 @@ static int param_array_set(const char *val, const struct kernel_param *kp)
 			   arr->elemsize, arr->ops->set, kp->level,
 			   arr->num ?: &temp_num);
 }
+EXPORT_SYMBOL(param_array_set);
 
-static int param_array_get(char *buffer, const struct kernel_param *kp)
+int param_array_get(char *buffer, const struct kernel_param *kp)
 {
 	int i, off, ret;
 	const struct kparam_array *arr = kp->arr;
@@ -492,8 +493,9 @@ static int param_array_get(char *buffer, const struct kernel_param *kp)
 	buffer[off] = '\0';
 	return off;
 }
+EXPORT_SYMBOL(param_array_get);
 
-static void param_array_free(void *arg)
+void param_array_free(void *arg)
 {
 	unsigned int i;
 	const struct kparam_array *arr = arg;
@@ -502,6 +504,7 @@ static void param_array_free(void *arg)
 		for (i = 0; i < (arr->num ? *arr->num : arr->max); i++)
 			arr->ops->free(arr->elem + arr->elemsize * i);
 }
+EXPORT_SYMBOL(param_array_free);
 
 const struct kernel_param_ops param_array_ops = {
 	.set = param_array_set,

-- 
2.51.0



